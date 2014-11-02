module Adapter
  module YmapsGeopicker
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def set_geopoints(*fields)
        if fields.size > 1
          lat_field = "@@lat_field = :#{fields[0]}"
          lng_field = "@@lng_field = :#{fields[1]}"
          lat_accessor  = 'cattr_accessor :lat_field'
          lng_accessor  = 'cattr_accessor :lng_field'
        else
          geofield = "@@geofield = :#{fields[0]}"
          writer   = "attr_writer :#{fields[0]}"
          accessor = 'cattr_accessor :geofield'
        end
        class_eval <<-EOV

          if #{geofield.present?}
            #{geofield}
            #{writer}
            #{accessor}
            def #{fields[0]}=(value)
              begin
                self[:borders] = value.map { |point| point.split(' ').map(&:to_f) }
              rescue
                self[:borders] = value
              end
            end
          else
            #{lat_field}
            #{lng_field}
            #{lat_accessor}
            #{lng_accessor}
          end
        EOV
      end
    end
  end
end