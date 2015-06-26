require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { genre_id: @question.genre_id, profile_expert_id: @question.profile_expert_id, profile_user_id: @question.profile_user_id, question_description: @question.question_description, question_type: @question.question_type, title: @question.title }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { genre_id: @question.genre_id, profile_expert_id: @question.profile_expert_id, profile_user_id: @question.profile_user_id, question_description: @question.question_description, question_type: @question.question_type, title: @question.title }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
