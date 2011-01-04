require 'test_helper'

class PhotographerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Photographer.new.valid?
  end
end
