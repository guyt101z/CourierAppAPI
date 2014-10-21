class AgenciesController < ApplicationController
  before_filter :restrict_access
  
  # GET /agencies
  # GET /agencies.json
  def index
    #pseudo scope        
    if params[:phone]        
      @agencies = Agency.find_by_phone(params[:phone]);
      if @agencies                
        respond_to do |format|
          format.json { render :json => @agencies }
          format.xml { render :xml => @agencies }
        end                
      else
        head :not_found
      end
    else
      # Aqui estoy haciendo que el api responda en mas de 1 formato
      @agencies = Agency.all
      respond_to do |format|
        format.json { render :json => @agencies }
        format.xml { render :xml => @agencies }
      end

    end    
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
    @agencies = Agency.find(params[:id])

    if @agencies                
      respond_to do |format|
        format.json { render :json => @agencies }
        format.xml { render :xml => @agencies }
      end                
    else
      head :not_found
    end
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(agency_params)

    if @agency.save
      render json: @agency, status: :created, location: @agency
    else
      render json: @agency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    @agency = Agency.find(params[:id])

    if @agency.update(agency_params)
      #head :no_content
      render json: @agency, status: :accepted, location: @agency #sera? status accepted? 
    else
      render json: @agency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency = Agency.find(params[:id])
    @agency.destroy

    #head :no_content
    head :accepted # o deberia dejarlo en not_content
  end

  private
    
    def agency_params
      #params.require(:agency).permit(:name, :phone, :address) #hice lo correcto?
      params.permit(:name, :phone, :address)
    end
  
    #sin accesso a menos que se encuentre el token...  via params
#     def restrict_access
#       api_key = ApiKey.find_by_access_token(params[:access_token])
#       head :unauthorized unless api_key 
#     end
  #via header
  
#     def restrict_access
#       authenticate_or_request_with_http_token do | token , options |
#         ApiKey.exists?(access_token: token)
#       end
#       #head :unauthorized unless api_key 
#     end
  # sin accesso a menos que se encuentre el token...  via request header...
    def restrict_access
      api_key = ApiKey.find_by_access_token(request.headers["token"])
      head :unauthorized unless api_key 
    end
end
