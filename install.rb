require 'fileutils'

sharethis_config = File.dirname(__FILE__) + '/../../../config/sharethis.yml'
FileUtils.cp File.dirname(__FILE__) + '/sharethis.yml.example', sharethis_config unless File.exist?(sharethis_config)
puts IO.read(File.join(File.dirname(__FILE__), 'README.textile'))