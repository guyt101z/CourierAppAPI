class APIKeyController < ApplicationController
  
  def create
    #verifico que el usuario haciendo la peticion sea valido, sus datos vienen por el header
    if request.headers["email"] && request.headers["password"] 
      @user = User.find_by_email(request.headers["email"])
      if @user && (request.headers["password"] == @user.password ) 
          #si el usuario resulto ser real
        @api_key = ApiKey.new(role:@user.role,user_id:@user.id)  
        if @api_key.save
          render json: @api_key, status: :created, location: @api_key
        else
          head :unauthorized
        end

      else #si resulta que falla en la contraseña
        head :unauthorized
      end    
    else #por si viene sin los headers email o password
      head :bad_request
    end
    
    
    #head :unauthorized unless @user
    
#     @api_key = ApiKey.new(key_params)
       
#     if @api_key.save
#       render json: @api_key, status: :created, location: @api_key
#     else
#       head :unauthorized
#     end
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
