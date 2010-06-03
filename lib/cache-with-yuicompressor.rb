module ActionView
  module Helpers
    module AssetTagHelper
      def write_asset_file_contents(joined_asset_path, asset_paths)

        FileUtils.mkdir_p(File.dirname(joined_asset_path))
        File.atomic_write(joined_asset_path) { |cache| cache.write(join_asset_file_contents(asset_paths)) }

        begin
          file = joined_asset_path
          jarpath = File.dirname(__FILE__) + "/yuicompressor-2.4.2.jar";
          #puts "JAR Path : #{jarpath}"
          cmd = "java -jar #{jarpath} #{file} -o #{file}"
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