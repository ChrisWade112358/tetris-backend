class Api::V1::UsersController < ApplicationController

    before_action only:(:update, :delete)

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

    def update
        bybug
        user = User.find_by(:name => user_params[:name])
        user.update(user_params)
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

      def get_user
        user = User.find_by(:name => user_params[:name])
      end
   
end
