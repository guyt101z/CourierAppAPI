class RatesController < ApplicationController
  before_filter :restrict_access
  # GET /rates
  # GET /rates.json
  def index
    @rates = Rate.all

   # Aqui estoy haciendo que el api responda en mas de 1 formato
   respond_to do |format|
      format.json { render :json => @rates }
      format.xml { render :xml => @rates }
    end
   # render json: @rates
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
      #head :no_content
      render json: @rate, status: :accepted, location: @rate #sera? status accepted? 
    else
      render json: @rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy

    #head :no_content
    head :accepted # o deberia dejarlo en not_content
  end

  private
    
    def rate_params
      #params.require(:rate).permit(:creator_id, :constant, :K_value)
      params.permit(:creator_id, :constant, :K_value)
    end
  
    def restrict_access
      api_key = ApiKey.find_by_access_token(request.headers["token"])
      head :unauthorized unless api_key 
    end
end
