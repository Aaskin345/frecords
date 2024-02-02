class FinancialRecordsController < ApplicationController
  before_action :set_financial_record, only: %i[show edit update destroy]

  def index
    @financial_records = FinancialRecord.all
  end

  def show
  end

  def new
    @financial_record = FinancialRecord.new
  end

  def create
    @financial_record = FinancialRecord.new(financial_record_params)

    if @financial_record.save
      redirect_to financial_records_path, notice: 'Financial record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @financial_record.update(financial_record_params)
      redirect_to financial_records_path, notice: 'Financial record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @financial_record.destroy
    redirect_to financial_records_path, notice: 'Financial record was successfully destroyed.'
  end

  private

  def set_financial_record
    @financial_record = FinancialRecord.find(params[:id])
  end

  def financial_record_params
    params.require(:financial_record).permit(:name, :amount, :date)
  end
end
