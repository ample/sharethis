module SharethisFu
  
  def self.included(base)
    base.extend ClassMethods
    base.helper SharethisFuHelper
  end

  module ClassMethods
    
    def uses_sharethis(options = {})
      begin
        sharethis_config = YAML.load_file("#{RAILS_ROOT}/config/sharethis.yml").symbolize_keys[:sharethis]
      rescue
        puts "Config file not found, or your credentials are malformed"
        exit
      end
      proc = Proc.new do |c|
        c.instance_variable_set(:@uses_sharethis, true)
        c.instance_variable_set(:@sharethis_config, sharethis_config)
      end
      before_filter(proc, options)
    end
    
  end
  
end