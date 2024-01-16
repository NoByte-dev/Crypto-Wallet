class CoinsController < ApplicationController
  before_action :fetch_coin, only: %i[ show edit update destroy ]
  before_action :fetch_mining_types, only: %i[ edit new create update]

  def index
    @coins = Coin.all
  end

  def show; end

  def new
    @coin = Coin.new
  end

  def edit; end

  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      redirect_to coins_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @coin.update(coin_params)
      redirect_to coins_path, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @coin.destroy!
    redirect_to coins_url, notice: t('.success')
  end

  private
    def coin_params
      params.require(:coin).permit(:description, :acronym, :image, :mining_type_id,)
    end

    def fetch_coin
      @coin = Coin.find(params[:id])
    end

    def fetch_mining_types
      @all_mining_types = MiningType.all.pluck(:description, :id)
    end
end
