# ymaps coordinates picker
module YmapsCoordinatesPicker
  # method for picker field rendering
  module ViewHelper
    # render coordinates picker field
    def render_picker(options={})
      # set option 'multiple' if object class contains class variable @@geofield
      options[:multiple] = object.class.class_variable_defined? '@@geofield'
      # options[:multiple] = object.var
      options = initialize_options options
      # model name from form attributes
      prefix = object.class.name.downcase
      # map can be single-point oriented or have multiple points
      if options.multiple
        latlng_field_name = "#{prefix}[#{object.class.geofield}][]" # name for input
        latlng_dom_class  = "#{prefix}_#{object.class.geofield}_ymaps_picker" # class for input
        markers = object.send(object.class.geofield).presence || [] # geopoints
      else
        lat_field_name = "#{prefix}[#{object.class.lat_field}]" # name for latitude input
        lat_dom_class  = "#{prefix}_#{object.class.lat_field}_ymaps_picker" # class for latitude input
        lng_field_name = "#{prefix}[#{object.class.lng_field}]" # name for longitude input
        lng_dom_class  = "#{prefix}_#{object.class.lng_field}_ymaps_picker" # class for longitude input
        lat = object.send(object.class.lat_field)
        lng = object.send(object.class.lng_field)
        markers = lat.present? && lng.present? ? [[lat, lng]] : []# geopoints
      end

      view_locals = {
        markers: markers,
        lat_field_name: lat_field_name,
        lng_field_name: lng_field_name,
        lat_dom_class: lat_dom_class,
        lng_dom_class: lng_dom_class,
        latlng_field_name: latlng_field_name,
        latlng_dom_class: latlng_dom_class,
        width: options.width,
        height: options.height
      }
      @template.render partial: '/ymaps_coordinates_picker/render_map', locals: view_locals
    end

    private

    # initialize default options from config
    def initialize_options(options = true)
      config_options = YmapsCoordinatesPicker.config.instance_variable_get('@_config')
      config_options.each_key { |key| options[key] = config_options[key] unless options[key] }
      OpenStruct.new(options)
    end
  end
end