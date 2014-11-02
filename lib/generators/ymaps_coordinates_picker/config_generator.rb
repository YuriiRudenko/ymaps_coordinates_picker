module YmapsCoordinatesPicker
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies YmapsCoordinatesPicker configuration file to your application's initializer directory.
DESC

      def copy_config_file
        template 'ymaps_coordinates_picker_config.rb', 'config/initializers/ymaps_coordinates_picker.rb'
      end
    end
  end
end
