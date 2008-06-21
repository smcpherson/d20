require File.dirname(__FILE__) + '/../test_helper'
require 'characters_controller'

# Re-raise errors caught by the controller.
class CharactersController; def rescue_action(e) raise e end; end

class CharactersControllerTest < Test::Unit::TestCase
  def setup
    @controller = CharactersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
