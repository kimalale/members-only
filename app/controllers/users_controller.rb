class UsersController < ApplicationController
    before_action :require_user, only: [:edit, :update, :destroy]

    def new
    @user = User.new
    end

    def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, :success => "Welcome, #{@user.first_name}."
    else
        redirect_to signup_path
    end
    end

    def index
    @users = User.all
    end

    def show
        @user = User.find(session[:user_id]) if session[:user_id]
    end

    def edit
        @user = User.find(session[:user_id])
    end

    def update
        @user = User.find(session[:user_id])
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = find(session[:user_id])
        @user.destroy

        redirect_to root_path, status: :see_other
    end

    private
    def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
    end
end
