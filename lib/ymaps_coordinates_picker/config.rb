require 'active_support/configurable'

module YmapsCoordinatesPicker

  def self.configure(&block)
    yield @config ||= YmapsCoordinatesPicker::Configuration.new
  end

  # Global settings for GmapCoordinatesPicker
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :locale
    config_accessor :width
    config_accessor :height
  end

  configure do |config|
    config.locale = 'en_US'
    config.width  = 600
    config.height = 400
  end
end