class SandwichesController < ApplicationController
  before_action :set_sandwich, only: [:show, :update, :destroy]

  # GET /sandwiches
  def index
    @sandwiches = Sandwich.all

    render json: @sandwiches
  end

  # GET /sandwiches/1
  def show
    render json: @sandwich
  end

  # POST /sandwiches
  def create
    @sandwich = Sandwich.new(sandwich_params)

    if @sandwich.save
      render json: @sandwich, status: :created, location: @sandwich
    else
      render json: @sandwich.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sandwiches/1
  def update
    if @sandwich.update(sandwich_params)
      render json: @sandwich
    else
      render json: @sandwich.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sandwiches/1
  def destroy
    @sandwich.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sandwich
      @sandwich = Sandwich.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sandwich_params
      params.require(:sandwich).permit(:name, :description, :price)
    end
end
