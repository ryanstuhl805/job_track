class NotesController < ApplicationController
  before_action :set_note, only: %i[ show update destroy ]

  # GET /notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    if params[:notes].present?
      @notes = []
      Note.transaction do
        @notes = params[:notes].map do |note_data|
          Note.create!(note_data.permit(:status, :links, :callout, company_notes_attributes: [:company_id]))
        end
      end
      render json: @notes, status: :created
    else
      @note = Note.new(note_params)

      if @note.save
        render json: @note, status: :created, location: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(
        :status,
        :links,
        :callout,
        company_notes: [],
        company_notes_attributes: [
          :id,
          :company_id,
          :_destroy
        ]
      )
    end
end
