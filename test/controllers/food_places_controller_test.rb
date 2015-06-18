require 'test_helper'

class FoodPlacesControllerTest < ActionController::TestCase
  setup do
    @food_place = food_places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_place" do
    assert_difference('FoodPlace.count') do
      post :create, food_place: { address: @food_place.address, name: @food_place.name, phone: @food_place.phone, website: @food_place.website }
    end

    assert_redirected_to food_place_path(assigns(:food_place))
  end

  test "should show food_place" do
    get :show, id: @food_place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_place
    assert_response :success
  end

  test "should update food_place" do
    patch :update, id: @food_place, food_place: { address: @food_place.address, name: @food_place.name, phone: @food_place.phone, website: @food_place.website }
    assert_redirected_to food_place_path(assigns(:food_place))
  end

  test "should destroy food_place" do
    assert_difference('FoodPlace.count', -1) do
      delete :destroy, id: @food_place
    end

    assert_redirected_to food_places_path
  end
end
