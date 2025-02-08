require "test_helper"

class CompanyNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_note = company_notes(:one)
  end

  test "should get index" do
    get company_notes_url, as: :json
    assert_response :success
  end

  test "should create company_note" do
    assert_difference("CompanyNote.count") do
      post company_notes_url, params: { company_note: { company_id: @company_note.company_id, note_id: @company_note.note_id } }, as: :json
    end

    assert_response :created
  end

  test "should show company_note" do
    get company_note_url(@company_note), as: :json
    assert_response :success
  end

  test "should update company_note" do
    patch company_note_url(@company_note), params: { company_note: { company_id: @company_note.company_id, note_id: @company_note.note_id } }, as: :json
    assert_response :success
  end

  test "should destroy company_note" do
    assert_difference("CompanyNote.count", -1) do
      delete company_note_url(@company_note), as: :json
    end

    assert_response :no_content
  end
end
