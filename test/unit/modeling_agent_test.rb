require 'test_helper'

class ModelingAgentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ModelingAgent.new.valid?
  end
end
