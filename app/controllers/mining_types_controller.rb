class MiningTypesController < ApplicationController
  before_action :fetch_mining_type, only: %i[ show edit update destroy ]

  def index
    @mining_types = MiningType.all
  end

  def show; end

  def new
    @mining_type = MiningType.new
  end

  def edit; end

  def create
    @mining_type = MiningType.new(mining_type_params)

    if @mining_type.save
      redirect_to mining_types_path, notice: t('.success')
    else
      render( :new, status: :unprocessable_entity )
    end
  end

  def update
    if @mining_type.update(mining_type_params)
      redirect_to mining_types_path, notice: t('.success')
    else
      render( :edit, status: :unprocessable_entity )
    end
  end

  def destroy
    @mining_type.destroy!
    redirect_to mining_types_url, notice: t('.success')
  end

  private

    def fetch_mining_type
      @mining_type = MiningType.find(params[:id])
    end

    def mining_type_params
      params.require(:mining_type).permit(:description, :acronym)
    end
end
