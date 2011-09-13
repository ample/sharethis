module Sharethis
  
  def self.included(base)
    base.extend ClassMethods
    base.helper SharethisHelper
  end

  module ClassMethods
    
    require "erb"
    include ERB::Util
    
    begin
      @@sharethis_config = YAML.load_file("#{Rails.root}/config/sharethis.yml").symbolize_keys[:sharethis]
    rescue
      Rails.logger.error "Config file not found, or your credentials are malformed, see #{Rails.root}/config/sharethis.yml"
      exit
    end
    
    def uses_sharethis(options = {})
      proc = Proc.new do |c|
        c.instance_variable_set(:@uses_sharethis, true)
        c.instance_variable_set(:@sharethis_widget_config, @@sharethis_config.collect{ |k,v| "#{k}:'#{v}'" }.compact.join(",\n"))
      end
      before_filter(proc, options)
    end
    
  end
  
end