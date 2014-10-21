module API
  module V1
    class AgenciesController < ApplicationController
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

    end
  end
end
