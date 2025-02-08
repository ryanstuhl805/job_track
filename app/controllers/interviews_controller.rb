class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[ show update destroy ]

  # GET /interviews
  def index
    @interviews = Interview.all

    render json: @interviews
  end

  # GET /interviews/1
  def show
    render json: @interview
  end

  # POST /interviews
  def create
    @interview = Interview.new(interview_params)

    if @interview.save
      render json: @interview, status: :created, location: @interview
    else
      render json: @interview.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /interviews/1
  def update
    if @interview.update(interview_params)
      render json: @interview
    else
      render json: @interview.errors, status: :unprocessable_entity
    end
  end

  # DELETE /interviews/1
  def destroy
    @interview.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def interview_params
      params.expect(interview: [ :stage ])
    end
end
