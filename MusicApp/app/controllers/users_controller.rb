class UsersController < ApplicationController
    before_action :require_login, except: [:show]
    def show
        render :show
    end

    def new 
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ["Invalid email/password"]
            render :new 
        end
    end


    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end