class APIKeyController < ApplicationController
  
  def create
    #verifico que el usuario haciendo la peticion sea valido
    
    
    @api_key = ApiKey.new(key_params)
       
    if @api_key.save
      render json: @api_key, status: :created, location: @api_key
    else
      head :unauthorized
    end
  end
  
  
  def destroy
    @api_key = ApiKey.find(params[:id])
    @api_key.destroy

    #head :no_content
    head :accepted # o deberia dejarlo en not_content
  end
  
  private
    
    def key_params      
      params.permit(:role, :user_id)
    end
    
  
end
