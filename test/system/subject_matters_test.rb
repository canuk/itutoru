require "application_system_test_case"

class SubjectMattersTest < ApplicationSystemTestCase
  setup do
    @subject_matter = subject_matters(:one)
  end

  test "visiting the index" do
    visit subject_matters_url
    assert_selector "h1", text: "Subject matters"
  end

  test "should create subject matter" do
    visit subject_matters_url
    click_on "New subject matter"

    fill_in "Description", with: @subject_matter.description
    fill_in "Name", with: @subject_matter.name
    click_on "Create Subject matter"

    assert_text "Subject matter was successfully created"
    click_on "Back"
  end

  test "should update Subject matter" do
    visit subject_matter_url(@subject_matter)
    click_on "Edit this subject matter", match: :first

    fill_in "Description", with: @subject_matter.description
    fill_in "Name", with: @subject_matter.name
    click_on "Update Subject matter"

    assert_text "Subject matter was successfully updated"
    click_on "Back"
  end

  test "should destroy Subject matter" do
    visit subject_matter_url(@subject_matter)
    click_on "Destroy this subject matter", match: :first

    assert_text "Subject matter was successfully destroyed"
  end
end
