class PackagesController < ApplicationController
  before_filter :restrict_access
  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all
   #Aqui estoy haciendo que el api responda en mas de 1 formato
   respond_to do |format|
      format.json { render :json => @packages }
      format.xml { render :xml => @packages }
    end
   # render json: @packages
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @package = Package.find(params[:id])

    render json: @package
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    if @package.save
      render json: @package, status: :created, location: @package
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    @package = Package.find(params[:id])

    if @package.update(package_params)
          #head :no_content
      render json: @package, status: :accepted, location: @package #sera? status accepted? 
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package = Package.find(params[:id])
    @package.destroy

    #head :no_content
    head :accepted # o deberia dejarlo en not_content
  end

  private
    
    def package_params
      #params.require(:package).permit(:sender_id, :receiver_id, :sender_agency_id, :receiver_agency_id, :status, :dispatched_at, :delivered_at, :lenght, :width, :height, :weight, :value)
       params.permit(:sender_id, :receiver_id, :sender_agency_id, :receiver_agency_id, :status, :dispatched_at, :delivered_at, :lenght, :width, :height, :weight, :value)
    end
    
    def restrict_access
      api_key = ApiKey.find_by_access_token(request.headers["token"])
      head :unauthorized unless api_key 
    end
end
