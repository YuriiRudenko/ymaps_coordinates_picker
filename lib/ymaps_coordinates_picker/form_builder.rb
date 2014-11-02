# picker module
module YmapsCoordinatesPicker #:nodoc
  # endwriting FormBuilder
  module FormBuilder
    # including initializer
    def self.included(base)
      # adding picker helper to ViewHelper module
      base.send(:include, YmapsCoordinatesPicker::ViewHelper)
      # adding picker form helper to FormBuilder module
      base.send(:include, YmapsCoordinatesPicker::FormBuilder::ClassMethods)
    end

    module ClassMethods
      # form picker field method
      def ymaps_coordinates_picker(options = {})
        # object-caller as a part of helper options
        options.update object: @object_name
        # render picker field
        render_picker(objectify_options(options))
      end
    end
  end
end