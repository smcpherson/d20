require File.dirname(__FILE__) + '/../test_helper'
require 'event_controller'

# Re-raise errors caught by the controller.
class EventController; def rescue_action(e) raise e end; end

class EventControllerTest < Test::Unit::TestCase
  def setup
    @controller = EventController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
