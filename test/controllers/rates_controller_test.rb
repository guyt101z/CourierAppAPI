require 'test_helper'

class RatesControllerTest < ActionController::TestCase
  setup do
    @rate = rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rates)
  end

  test "should create rate" do
    assert_difference('Rate.count') do
      post :create, rate: { K_value: @rate.K_value, constant: @rate.constant, creator_id: @rate.creator_id }
    end

    assert_response 201
  end

  test "should show rate" do
    get :show, id: @rate
    assert_response :success
  end

  test "should update rate" do
    put :update, id: @rate, rate: { K_value: @rate.K_value, constant: @rate.constant, creator_id: @rate.creator_id }
    assert_response 204
  end

  test "should destroy rate" do
    assert_difference('Rate.count', -1) do
      delete :destroy, id: @rate
    end

    assert_response 204
  end
end
