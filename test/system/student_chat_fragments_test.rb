require "application_system_test_case"

class StudentChatFragmentsTest < ApplicationSystemTestCase
  setup do
    @student_chat_fragment = student_chat_fragments(:one)
  end

  test "visiting the index" do
    visit student_chat_fragments_url
    assert_selector "h1", text: "Student chat fragments"
  end

  test "should create student chat fragment" do
    visit student_chat_fragments_url
    click_on "New student chat fragment"

    fill_in "Chat text", with: @student_chat_fragment.chat_text
    fill_in "Response type", with: @student_chat_fragment.response_type
    fill_in "Student chat", with: @student_chat_fragment.student_chat_id
    fill_in "Student response", with: @student_chat_fragment.student_response
    click_on "Create Student chat fragment"

    assert_text "Student chat fragment was successfully created"
    click_on "Back"
  end

  test "should update Student chat fragment" do
    visit student_chat_fragment_url(@student_chat_fragment)
    click_on "Edit this student chat fragment", match: :first

    fill_in "Chat text", with: @student_chat_fragment.chat_text
    fill_in "Response type", with: @student_chat_fragment.response_type
    fill_in "Student chat", with: @student_chat_fragment.student_chat_id
    fill_in "Student response", with: @student_chat_fragment.student_response
    click_on "Update Student chat fragment"

    assert_text "Student chat fragment was successfully updated"
    click_on "Back"
  end

  test "should destroy Student chat fragment" do
    visit student_chat_fragment_url(@student_chat_fragment)
    click_on "Destroy this student chat fragment", match: :first

    assert_text "Student chat fragment was successfully destroyed"
  end
end
