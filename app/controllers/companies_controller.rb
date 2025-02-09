class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show destroy ]
  before_action :set_company_for_update, only: %i[ update ]

  # GET /companies
  def index
    @companies = Company.all.includes(:notes)

    render json: @companies, include: :notes
  end

  # GET /companies/1
  def show
    render json: @company
  end

  # POST /companies
  def create
    if params[:companies].present?
      @companies = []
      Company.transaction do
        @companies = params[:companies].map do |company_data|
          Company.create!(company_data.permit(:name))
        end
      end
      render json: @companies, status: :created
    else
      @company = Company.new(company_params)

      if @company.save
        render json: @company, status: :created, location: @company
      else
        render json: @company.errors, status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params.expect(:id))
    end

    def set_company_for_update
      @company = Company.find_by(id: company_update_params[:id])
    end

    # Only allow a list of trusted parameters through.

    def company_update_params
      params.require(:company).permit(
        :id,
      )
    end

    def company_params
      params.require(:company).permit(
        :name,
        notes: [],
        notes_attributes: [
          :id,
          :status,
          :website_links,
          :important_date,
          :_destroy
        ]
      )
    end
end
