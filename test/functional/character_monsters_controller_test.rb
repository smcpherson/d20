require File.dirname(__FILE__) + '/../test_helper'
require 'character_monsters_controller'

# Re-raise errors caught by the controller.
class CharacterMonstersController; def rescue_action(e) raise e end; end

class CharacterMonstersControllerTest < Test::Unit::TestCase
  def setup
    @controller = CharacterMonstersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
