class ProceduresController < ApplicationController
  before_action :set_procedure, only: %i[ show edit update destroy ]

  def index
    @procedures = Procedure.all
  end

  def new
    @procedure = Procedure.new
  end

  def edit
  end

  def show
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      redirect_to procedure_url(@procedure), notice: "Article was successfully created."
    else
      render :new
    end
  end

  def update
    if @procedure.update(procedure_params)
      redirect_to procedure_url(@procedure), notice: "Article was successfully update."
    else
      render :edit
    end
  end


  private

    def set_procedure
      @procedure = Procedur.find(params[:id])
    end

    def procedure_params
      params.require(:procedure).permit(:image, :content, :date, :deadline)
    end
end
