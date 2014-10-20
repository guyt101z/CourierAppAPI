module API
  module V1
    class UsersController < ApplicationController
      # GET /users
      # GET /users.json
      def index
        @users = User.all

        render json: @users
      end

      # GET /users/1
      # GET /users/1.json
      def show
        @user = User.find(params[:id])
        # Aqui estoy haciendo que el api responda en mas de 1 formato
        respond_to do |format|
          format.json { render :json => @users }
          format.xml { render :xml => @ausers }
        end
        #render json: @user
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
    end
  end
end