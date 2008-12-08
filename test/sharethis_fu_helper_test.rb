require File.dirname(__FILE__) + '/../../../../test/test_helper'
require File.expand_path(File.dirname(__FILE__) + '/helper_testcase')

class SharethisFuHelperTest < HelperTestCase
  
  include SharethisFuHelper

  def setup
    @uses_sharethis = nil
    super
  end
  
  def test_javascript_include_sharethis
    assert_match /w.sharethis.com\/widget/, include_sharethis_js
    # We don't match the full string because asset timestamping gets in the way...
  end

  def test_javascript_include_sharethis_if_needed
    assert_nil include_sharethis_if_needed
    @uses_sharethis = true
    assert_match /w.sharethis.com\/widget/, include_sharethis_if_needed
  end

end