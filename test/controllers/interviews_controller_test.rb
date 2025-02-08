require "test_helper"

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interview = interviews(:one)
  end

  test "should get index" do
    get interviews_url, as: :json
    assert_response :success
  end

  test "should create interview" do
    assert_difference("Interview.count") do
      post interviews_url, params: { interview: { stage: @interview.stage } }, as: :json
    end

    assert_response :created
  end

  test "should show interview" do
    get interview_url(@interview), as: :json
    assert_response :success
  end

  test "should update interview" do
    patch interview_url(@interview), params: { interview: { stage: @interview.stage } }, as: :json
    assert_response :success
  end

  test "should destroy interview" do
    assert_difference("Interview.count", -1) do
      delete interview_url(@interview), as: :json
    end

    assert_response :no_content
  end
end
