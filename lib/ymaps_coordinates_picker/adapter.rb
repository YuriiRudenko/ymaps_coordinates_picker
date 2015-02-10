module Adapter
  module YmapsGeopicker
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def set_geopoints(*fields)
        if fields.size < 2
          key = fields[0].to_sym
          cattr_accessor :geofield
          attr_writer key
          self.geofield = key
          self.send(
            :define_method,
            "#{key}=",
            -> (value) { self[:borders] = value.map { |point| point.split(' ').map(&:to_f) } }
          )
        else
          cattr_accessor :lat_field
          cattr_accessor :lng_field
          self.lng_field = fields[1]
          self.lat_field = fields[0]
        end
      end
    end
  end
end