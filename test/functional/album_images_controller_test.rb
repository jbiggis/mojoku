require 'test_helper'

class AlbumImagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => AlbumImage.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    AlbumImage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    AlbumImage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to album_image_url(assigns(:album_image))
  end

  def test_edit
    get :edit, :id => AlbumImage.first
    assert_template 'edit'
  end

  def test_update_invalid
    AlbumImage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AlbumImage.first
    assert_template 'edit'
  end

  def test_update_valid
    AlbumImage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AlbumImage.first
    assert_redirected_to album_image_url(assigns(:album_image))
  end

  def test_destroy
    album_image = AlbumImage.first
    delete :destroy, :id => album_image
    assert_redirected_to album_images_url
    assert !AlbumImage.exists?(album_image.id)
  end
end
