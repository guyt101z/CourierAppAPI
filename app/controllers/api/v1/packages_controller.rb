module API
  module V1
    class PackagesController < ApplicationController
      # GET /packages
      # GET /packages.json
      def index
        #un pseudo scope para la busqueda por parametros del paquete
          if params[:sender_id]        
            @packages = Package.where(sender_id:params[:sender_id]);
            if @packages                
                respond_to do |format|
                  format.json { render :json => @packages }
                  format.xml { render :xml => @packages }
                end                
              else
                head :not_found
              end
          elsif params[:receiver_id] 
              @packages = Package.where(receiver_id:params[:receiver_id]);
              if @packages
                
                respond_to do |format|
                  format.json { render :json => @packages }
                  format.xml { render :xml => @packages }
                end
                
              else
                head :not_found
              end
          elsif params[:sender_agency_id] 
              @packages = Package.where(sender_agency_id:params[:sender_agency_id]);
              if @packages
                
                respond_to do |format|
                  format.json { render :json => @packages }
                  format.xml { render :xml => @packages }
                end
                
              else
                head :not_found
              end
          elsif params[:receiver_agency_id] 
              @packages = Package.where(receiver_agency_id:params[:receiver_agency_id]);
              if @packages
                
                respond_to do |format|
                  format.json { render :json => @packages }
                  format.xml { render :xml => @packages }
                end
                
              else
                head :not_found
              end
          else
            # Aqui estoy haciendo que el api responda en mas de 1 formato
            @packages = Package.all
            respond_to do |format|
              format.json { render :json => @packages }
              format.xml { render :xml => @packages }
            end

          end    
      end
      
      # GET /packages/1
      # GET /packages/1.json
      def show
        @packages = Package.find(params[:id])
        if @packages
          respond_to do |format|
            format.json { render :json => @packages }
            format.xml { render :xml => @packages }
          end

        else
          head :not_found
        end
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
    end
  end 
end