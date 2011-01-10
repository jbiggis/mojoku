require 'test_helper'

class AlbumImageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert AlbumImage.new.valid?
  end
end
