module SharethisFu
  
  def self.included(base)
    base.extend ClassMethods
    base.helper SharethisFuHelper
  end

  module ClassMethods
    
    require "erb"
    include ERB::Util
    
    begin
      @@sharethis_config = YAML.load_file("#{RAILS_ROOT}/config/sharethis.yml").symbolize_keys[:sharethis]
    rescue
      RAILS_DEFAULT_LOGGER.error "Config file not found, or your credentials are malformed"
      exit
    end
    
    def uses_sharethis(options = {})
      proc = Proc.new do |c|
        c.instance_variable_set(:@uses_sharethis, true)
        c.instance_variable_set(:@sharethis_widget_config, @@sharethis_config.collect{ |k,v| "#{k}=#{u(v)}" }.compact.join("&"))
      end
      before_filter(proc, options)
    end
    
  end
  
end