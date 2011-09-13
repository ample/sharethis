module SharethisHelper

  # Available parameters for the JS STAPI
  # http://help.sharethis.com/customization/share-properties
  SharethisSpanParams = [ :url, :title, :image, :summary ]
  SharethisJSParams = [ :service, :element, :type, :text ] | SharethisSpanParams
  
  
  def sharethis(options = {})
    entry = options.collect { |k,v| "st_#{k}=\"#{escape_javascript(v)}\"" if SharethisJSParams.include?(k) }.compact.join(" ")
    %{<span class="st_sharethis" #{entry} displayText="ShareThis"></span>"}.html_safe
  end
  
  def sharethis_js(options = {})
    entry = options.collect { |k,v| "#{k}:\"#{escape_javascript(v)}\"" if SharethisJSParams.include?(k) }.compact.join(",\n")
    <<-END
      <script type=\"text/javascript\">
        stWidget.addEntry({
          #{entry}
        });
      </script>
    END
  end
  
  def include_sharethis_js
    <<-END
      <script type="text/javascript">var switchTo5x=true;</script>
      <script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
      <script type="text/javascript">
        stLight.options({
          #{@sharethis_widget_config}
        });
      </script>
    END
  end
  
  def include_sharethis_if_needed
    include_sharethis_js if using_sharethis?
  end
  
  def using_sharethis?
    @uses_sharethis
  end
  
end