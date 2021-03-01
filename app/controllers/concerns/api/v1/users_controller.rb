class Api::V1::UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end
  
    def create
        if User.find_by(:name => user_params[:name]) && User.find_by(:password => user_params[:password])
            user = User.find_by(:name => user_params[:name])
            render json: user
        else
            user = User.create(user_params)
            render json: user
        end
    end

    def show
        user = User.find_by(:name => user_params[:name])
        render json: user
    end

    def destroy
        user = User.find_by(id: params[:id]).destroy
        render json: user
    end

  
  
  
  
    private
      def user_params
        params.require(:user).permit(:name, :password)
      end
   
end
