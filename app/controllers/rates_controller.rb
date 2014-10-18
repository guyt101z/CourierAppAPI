class RatesController < ApplicationController
  # GET /rates
  # GET /rates.json
  def index
    @rates = Rate.all

    render json: @rates
  end

  # GET /rates/1
  # GET /rates/1.json
  def show
    @rate = Rate.find(params[:id])

    render json: @rate
  end

  # POST /rates
  # POST /rates.json
  def create
    @rate = Rate.new(rate_params)

    if @rate.save
      render json: @rate, status: :created, location: @rate
    else
      render json: @rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rates/1
  # PATCH/PUT /rates/1.json
  def update
    @rate = Rate.find(params[:id])

    if @rate.update(rate_params)
      head :no_content
    else
      render json: @rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy

    head :no_content
  end

  private
    
    def rate_params
      params.require(:rate).permit(:creator_id, :constant, :K_value)
    end
end
