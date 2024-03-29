class UsersController < ApplicationController
    before_action :authenticated?, only: [:index, :show, :edit, :destroy]

    

    def index
        @users = User.all.sort_by{|user|user.username}
    end

    def show
        @user = User.find(params[:id])
        session[:user] = @user.id
    end

    def new
        @user = User.new
        @disable_nav = true
    end

    def create
        new_user = User.new(user_params)
        if !new_user.valid?
            flash[:errors]= new_user.errors.full_messages
            redirect_to new_user_path
        else
            new_user.save
            redirect_to sign_in_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(session[:id])
        @user.update(user_params)
        if !@user.valid?
            flash[:errors]= @user.errors.full_messages
            redirect_to edit_user_path
        else @user.save
            redirect_to user_path(@user)
        end
    end

    def welcome
        @events = Event.all
        @disable_nav = true
    end

    def friends
        @user = User.find(session[:user])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to '/sign_in'
    end

   

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :age, :bio, :username, :password, :img_url)
    end

    def authenticated?
        if session[:id] != nil
            @user = User.find(session[:id])
        else
            redirect_to '/sign_in'
        end
    end

end