require 'ymaps_coordinates_picker/config'
# requiring picker engine
require 'ymaps_coordinates_picker/engine' if defined?(Rails)
# picker autoloader
module YmapsCoordinatesPicker
  # adding picker helper to ViewHelper module
  autoload :ViewHelper, 'ymaps_coordinates_picker/view_helper'
  # adding picker form helper to FormBuilder module
  autoload :FormBuilder, 'ymaps_coordinates_picker/form_builder'
  # adding picker form helper to Formtastic module
  autoload :FormtasticMapBuilder, 'ymaps_coordinates_picker/formtastic'
end