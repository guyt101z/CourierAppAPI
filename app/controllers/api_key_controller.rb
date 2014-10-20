class APIKeyController < ApplicationController
  
  def create
    @api_key = ApiKey.new(key_params)

    if @api_key.save
      render json: @api_key, status: :created, location: @api_key
    else
      head :unauthorized
    end
  end
  
  
  def destroy
    @package = Package.find(params[:id])
    @package.destroy

    #head :no_content
    head :accepted # o deberia dejarlo en not_content
  end
  
  private
    
    def key_params      
      params.permit(:role, :user_id)
    end
  
  
end
