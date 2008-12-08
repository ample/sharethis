module SharethisFuHelper

  # Available parameters for the JS STAPI
  # http://www.sharethis.com/publisher?type=stapi
  SharethisJSParams = [ :title, :url, :content, :icon, :summary, :updated, :published ]
  
  def sharethis(options = {})
    # magic here
  end
  
  def include_sharethis_js
    javascript_include_tag 'http://w.sharethis.com/widget/'
  end
  
  def include_sharethis_if_needed
    include_sharethis_js if using_sharethis?
  end
  
  def using_sharethis?
    @uses_sharethis
  end
  
end