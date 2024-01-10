class HomeController < ApplicationController
  def index
    @nome = params[:nome]
  end
end
