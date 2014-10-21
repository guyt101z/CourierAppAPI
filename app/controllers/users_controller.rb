class UsersController < ApplicationController
  before_filter :restrict_access
  # GET /users
  # GET /users.json
      def index
        #array = array.uniq#remueve duplicados
        #@users = User.all
        
        #un pseudo scope para la busqueda por parametros del paquete
          if params[:cedula]        
            @users = User.find_by_cedula(params[:cedula]);
            if @users                
                respond_to do |format|
                  format.json { render :json => @users }
                  format.xml { render :xml => @users }
                end                
              else
                head :not_found
              end
          elsif params[:email] 
              @users = User.find_by_email(params[:email]);
              if @users
                
                respond_to do |format|
                  format.json { render :json => @users }
                  format.xml { render :xml => @users }
                end
                
              else
                head :not_found
              end
          else
            # Aqui estoy haciendo que el api responda en mas de 1 formato
            @users = User.all
            respond_to do |format|
              format.json { render :json => @users }
              format.xml { render :xml => @users }
            end

          end    
      end

  # GET /users/1
  # GET /users/1.json
  def show
    @users = User.find(params[:id])
    if @users
      respond_to do |format|
        format.json { render :json => @users }
        format.xml { render :xml => @users }
      end
    else
      head :not_found
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      #head :no_content
      render json: @user, status: :accepted, location: @user #sera? status accepted? 
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    #head :no_content
    head :accepted # o deberia dejarlo en not_content
  end

  private
    
    def user_params
      #params.require(:user).permit(:email, :password, :role, :cedula, :name, :lastname, :phone)
      params.permit(:email, :password, :role, :cedula, :name, :lastname, :phone)
    end
 
    def restrict_access
      api_key = ApiKey.find_by_access_token(request.headers["token"])
      head :unauthorized unless api_key 
    end
 
end
