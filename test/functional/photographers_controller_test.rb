require 'test_helper'

class PhotographersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Photographer.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Photographer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Photographer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to photographer_url(assigns(:photographer))
  end

  def test_edit
    get :edit, :id => Photographer.first
    assert_template 'edit'
  end

  def test_update_invalid
    Photographer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Photographer.first
    assert_template 'edit'
  end

  def test_update_valid
    Photographer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Photographer.first
    assert_redirected_to photographer_url(assigns(:photographer))
  end

  def test_destroy
    photographer = Photographer.first
    delete :destroy, :id => photographer
    assert_redirected_to photographers_url
    assert !Photographer.exists?(photographer.id)
  end
end
