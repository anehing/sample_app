class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    
      @users = User.paginate(page: params[:page])
  end
  def new
     @user = User.new
  end
  def show
      @user = User.find(params[:id])
  end
  def edit
      # @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
       # Handle a successful save.
       flash[:success] = "Welcome to the Sample App! "+ @user.name
       sign_in @user
       redirect_to @user
    else
      render 'new'
    end
  end
  def update
      # @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        # Handle a successful update.
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
  end
  def destroy
      
      User.find(params[:id]).destroy

      flash[:success] = "User destoryed."

      redirect_to users_url
      # @user = User.find(params[:id])
  end
    
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
    
    def signed_in_user
      
      store_location #存储请求url
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
      
    end  
    
    def correct_user
      
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
        flash[:error] = "No destoryed."
        redirect_to(root_path) unless current_user.admin?
    end
end
