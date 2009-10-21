module SharethisFuHelper

  # Available parameters for the JS STAPI
  # http://www.sharethis.com/publisher?type=stapi
  SharethisJSParams = [ :title, :url, :content, :icon, :summary, :updated, :published ]
  
  def sharethis(options = {})
    entry = options.collect { |k,v| "#{k}:\"#{escape_javascript(v)}\"" if SharethisJSParams.include?(k) }.compact.join(",\n")
    options[:button] ||= 'true'
    options[:onmouseover] ||= 'true'
    attachment = options[:dom_id] ? "st_object.attachButton(document.getElementById('#{options[:dom_id]}'));" : ''
    <<-END
      <script type=\"text/javascript\">
        var st_object = SHARETHIS.addEntry({
          #{entry}
        }, {button:#{options[:button]}, onmouseover:#{options[:onmouseover]}});
        #{attachment}
      </script>
    END
  end
  
  def include_sharethis_js
    %{<script type="text/javascript" src="http://w.sharethis.com/button/sharethis.js##{@sharethis_widget_config}"></script>}
  end
  
  def include_sharethis_if_needed
    include_sharethis_js if using_sharethis?
  end
  
  def using_sharethis?
    @uses_sharethis
  end
  
end