class MiningTypesController < ApplicationController
  before_action :fetch_mining_type, only: %i[ show edit update destroy ]
  before_action :set_breadcrumbs

  def index
    @mining_types = MiningType.all
  end

  def show
    add_breadcrumb(@mining_type.description, edit_mining_type_path(@mining_type))
  end

  def new
    @mining_type = MiningType.new
    add_breadcrumb("New Post")
  end

  def edit
    add_breadcrumb(@mining_type.description)
  end

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

    def set_breadcrumbs
      add_breadcrumb("Home", root_path)
      add_breadcrumb("Mining Types", coins_path)
    end
end
