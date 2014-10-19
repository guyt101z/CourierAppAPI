class PackagesController < ApplicationController
  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all

    render json: @packages
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
      head :no_content
    else
      render json: @package.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package = Package.find(params[:id])
    @package.destroy

    head :no_content
  end

  private
    
    def package_params
      params.require(:package).permit(:sender_id, :receiver_id, :sender_agency_id, :receiver_agency_id, :status, :dispatched_at, :delivered_at, :lenght, :width, :height, :weight, :value)
    end
end
