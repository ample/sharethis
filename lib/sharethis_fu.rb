module SharethisFu
  
  def self.included(base)
    base.extend ClassMethods
    base.helper SharethisFuHelper
  end

  module ClassMethods
    
    begin
      @@sharethis_config = YAML.load_file("#{RAILS_ROOT}/config/sharethis.yml").symbolize_keys[:sharethis]
    rescue
      puts "Config file not found, or your credentials are malformed"
      exit
    end
    
    def uses_sharethis(options = {})
      proc = Proc.new do |c|
        c.class_variable_set(:@uses_sharethis, true)
        c.class_variable_set(:@sharethis_widget_config, @@sharethis_config.collect{ |k,v| "#{k}=v"}.compact.join("&"))
      end
      before_filter(proc, options)
    end
    
  end
  
end