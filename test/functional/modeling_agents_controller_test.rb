require 'test_helper'

class ModelingAgentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ModelingAgent.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ModelingAgent.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ModelingAgent.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to modeling_agent_url(assigns(:modeling_agent))
  end

  def test_edit
    get :edit, :id => ModelingAgent.first
    assert_template 'edit'
  end

  def test_update_invalid
    ModelingAgent.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ModelingAgent.first
    assert_template 'edit'
  end

  def test_update_valid
    ModelingAgent.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ModelingAgent.first
    assert_redirected_to modeling_agent_url(assigns(:modeling_agent))
  end

  def test_destroy
    modeling_agent = ModelingAgent.first
    delete :destroy, :id => modeling_agent
    assert_redirected_to modeling_agents_url
    assert !ModelingAgent.exists?(modeling_agent.id)
  end
end
