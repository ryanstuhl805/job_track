class CompanyNotesController < ApplicationController
  before_action :set_company_note, only: %i[ show update destroy ]

  # GET /company_notes
  def index
    @company_notes = CompanyNote.all

    render json: @company_notes
  end

  # GET /company_notes/1
  def show
    render json: @company_note
  end

  # POST /company_notes
  def create
    @company_note = CompanyNote.new(company_note_params)

    if @company_note.save
      render json: @company_note, status: :created, location: @company_note
    else
      render json: @company_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_notes/1
  def update
    if @company_note.update(company_note_params)
      render json: @company_note
    else
      render json: @company_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /company_notes/1
  def destroy
    @company_note.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_note
      @company_note = CompanyNote.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def company_note_params
      params.expect(company_note: [ :company_id, :note_id ])
    end
end
