require File.dirname(__FILE__) + '/../test_helper'
require 'monsters_controller'

# Re-raise errors caught by the controller.
class MonstersController; def rescue_action(e) raise e end; end

class MonstersControllerTest < Test::Unit::TestCase
  def setup
    @controller = MonstersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
