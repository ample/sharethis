require File.dirname(__FILE__) + '/../../../../test/test_helper'
require 'sharethis_fu'

class SharethisFuController < ApplicationController
  
  uses_sharethis

  def show
    render :nothing => true
  end
  
end

class SharethisFuTest < ActionController::TestCase
  
  tests SharethisFuController
  
  def test_truth
    assert true
  end
  
end