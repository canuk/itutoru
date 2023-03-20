require "test_helper"

class StudentChatFragmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_chat_fragment = student_chat_fragments(:one)
  end

  test "should get index" do
    get student_chat_fragments_url
    assert_response :success
  end

  test "should get new" do
    get new_student_chat_fragment_url
    assert_response :success
  end

  test "should create student_chat_fragment" do
    assert_difference("StudentChatFragment.count") do
      post student_chat_fragments_url, params: { student_chat_fragment: { chat_text: @student_chat_fragment.chat_text, response_type: @student_chat_fragment.response_type, student_chat_id: @student_chat_fragment.student_chat_id, student_response: @student_chat_fragment.student_response } }
    end

    assert_redirected_to student_chat_fragment_url(StudentChatFragment.last)
  end

  test "should show student_chat_fragment" do
    get student_chat_fragment_url(@student_chat_fragment)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_chat_fragment_url(@student_chat_fragment)
    assert_response :success
  end

  test "should update student_chat_fragment" do
    patch student_chat_fragment_url(@student_chat_fragment), params: { student_chat_fragment: { chat_text: @student_chat_fragment.chat_text, response_type: @student_chat_fragment.response_type, student_chat_id: @student_chat_fragment.student_chat_id, student_response: @student_chat_fragment.student_response } }
    assert_redirected_to student_chat_fragment_url(@student_chat_fragment)
  end

  test "should destroy student_chat_fragment" do
    assert_difference("StudentChatFragment.count", -1) do
      delete student_chat_fragment_url(@student_chat_fragment)
    end

    assert_redirected_to student_chat_fragments_url
  end
end
