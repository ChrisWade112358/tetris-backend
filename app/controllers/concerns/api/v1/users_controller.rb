class Api::V1::UsersController < ApplicationController


    def index
        users = User.all
        render json: users
    end
  
    def create
        if User.find_by(:name => user_params[:name]) && User.find_by(:password => user_params[:password])
            user = User.find_by(:name => user_params[:name]) && User.find_by(:password => user_params[:password])
            render json: user
        else
            user = User.create(user_params)
            render json: user
        end
    end

    def show
        bybug
        user = User.find_by_id(params[:id])
        render json: user
    end


    def update
        user = User.find_by_id(params[:id])
        user.update(user_params)
        render json: user
    end



    def destroy
        user = User.find_by_id(params[:id])
        user.delete
        render json: user
    end

  
  
  
  
    private
      def user_params
        params.require(:user).permit(:id, :name, :password)
      end

      
   
end
