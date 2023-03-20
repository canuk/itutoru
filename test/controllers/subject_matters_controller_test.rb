require "test_helper"

class SubjectMattersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_matter = subject_matters(:one)
  end

  test "should get index" do
    get subject_matters_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_matter_url
    assert_response :success
  end

  test "should create subject_matter" do
    assert_difference("SubjectMatter.count") do
      post subject_matters_url, params: { subject_matter: { description: @subject_matter.description, name: @subject_matter.name } }
    end

    assert_redirected_to subject_matter_url(SubjectMatter.last)
  end

  test "should show subject_matter" do
    get subject_matter_url(@subject_matter)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_matter_url(@subject_matter)
    assert_response :success
  end

  test "should update subject_matter" do
    patch subject_matter_url(@subject_matter), params: { subject_matter: { description: @subject_matter.description, name: @subject_matter.name } }
    assert_redirected_to subject_matter_url(@subject_matter)
  end

  test "should destroy subject_matter" do
    assert_difference("SubjectMatter.count", -1) do
      delete subject_matter_url(@subject_matter)
    end

    assert_redirected_to subject_matters_url
  end
end
