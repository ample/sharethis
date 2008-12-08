require File.dirname(__FILE__) + '/../../../../test/test_helper'
require 'sharethis_fu'

class SharethisFuController < ApplicationController
  
  uses_sharethis

  # Add other helpers here if you need them
  include ActionView::Helpers::ActiveRecordHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::PrototypeHelper
  
  def show
    render :nothing => true
  end
  
end

class SharethisFuTest < ActionController::TestCase
  
  tests SharethisFuController
  include SharethisFuHelper
  
  def test_truth
    assert true
  end
  
  # def test_uses_sharethis
  #   assert @uses_sharethis
  # end
  
  # def test_javascript_include_sharethis
  #   assert_match /w.sharethis.com\/widget/, include_sharethis_js
  #   # We don't match the full string because asset timestamping gets in the way...
  # end

  # def test_javascript_include_sharethis_if_needed
  #   @uses_sharethis = nil
  #   assert_nil include_sharethis_if_needed
  #   @uses_sharethis = true
  #   assert_match /w.sharethis.com\/widget/, include_sharethis_if_needed
  # end
  
end