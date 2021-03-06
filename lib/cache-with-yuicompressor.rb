module ActionView
  module Helpers
    module AssetTagHelper
      def write_asset_file_contents(joined_asset_path, asset_paths)

        FileUtils.mkdir_p(File.dirname(joined_asset_path))
        File.atomic_write(joined_asset_path) { |cache| cache.write(join_asset_file_contents(asset_paths)) }

        begin
          # remove console.log calls 
          temp_file_path = joined_asset_path + ".tmp"
          f = File.open(joined_asset_path)
          fo = File.new(temp_file_path, "w")
          f.each {|line|
            fo.puts line.gsub(/console.(log|debug|info|warn|error|assert|dir|dirxml|trace|group|groupEnd|time|timeEnd|profile|profileEnd|count)\((.*)\);?/,"");
          }
          fo.close
          f.close

          # copy the file to the joined_asset_path
          system("cp #{temp_file_path} #{joined_asset_path}")

          # ask yui compressor to compress the file
          jarpath = File.dirname(__FILE__) + "/yuicompressor-2.4.2.jar";
          cmd = "java -jar #{jarpath} #{joined_asset_path} -o #{joined_asset_path}"
          ret = system(cmd)
        rescue
        end
        
        # Set mtime to the latest of the combined files to allow for
        # consistent ETag without a shared filesystem.
        mt = asset_paths.map { |p| File.mtime(asset_file_path(p)) }.max
        File.utime(mt, mt, joined_asset_path)
      end
    end
  end
end
