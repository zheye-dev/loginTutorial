class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(users_params)
        if @user.save
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        current_user_session.destroy
        redirect_to root_path
    end

    private

    def users_params
        params.require(:user).permit(:login, :password, :password_confirmation)
    end
end
