require 'test_helper'

class ProfileExpertsControllerTest < ActionController::TestCase
  setup do
    @profile_expert = profile_experts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_experts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_expert" do
    assert_difference('ProfileExpert.count') do
      post :create, profile_expert: { about: @profile_expert.about, ask_expert_id: @profile_expert.ask_expert_id, first_name: @profile_expert.first_name, free_questions: @profile_expert.free_questions, last_name: @profile_expert.last_name, skype: @profile_expert.skype }
    end

    assert_redirected_to profile_expert_path(assigns(:profile_expert))
  end

  test "should show profile_expert" do
    get :show, id: @profile_expert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_expert
    assert_response :success
  end

  test "should update profile_expert" do
    patch :update, id: @profile_expert, profile_expert: { about: @profile_expert.about, ask_expert_id: @profile_expert.ask_expert_id, first_name: @profile_expert.first_name, free_questions: @profile_expert.free_questions, last_name: @profile_expert.last_name, skype: @profile_expert.skype }
    assert_redirected_to profile_expert_path(assigns(:profile_expert))
  end

  test "should destroy profile_expert" do
    assert_difference('ProfileExpert.count', -1) do
      delete :destroy, id: @profile_expert
    end

    assert_redirected_to profile_experts_path
  end
end
