require File.dirname(__FILE__) + '/../test_helper'

class ChapbooksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:chapbooks)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_chapbook
    assert_difference('Chapbook.count') do
      post :create, :chapbook => { }
    end

    assert_redirected_to chapbook_path(assigns(:chapbook))
  end

  def test_should_show_chapbook
    get :show, :id => chapbooks(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => chapbooks(:one).id
    assert_response :success
  end

  def test_should_update_chapbook
    put :update, :id => chapbooks(:one).id, :chapbook => { }
    assert_redirected_to chapbook_path(assigns(:chapbook))
  end

  def test_should_destroy_chapbook
    assert_difference('Chapbook.count', -1) do
      delete :destroy, :id => chapbooks(:one).id
    end

    assert_redirected_to chapbooks_path
  end
end
