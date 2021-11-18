class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create show)
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "pages.flash.danger"
    redirect_to login_url
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "pages.flash.success"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by params[:id]
    if @user.update user_params
      flash[:success] = t "pages.profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find_by id: params[:id]
    if user&.destroy
      flash[:success] = t "pages.flash.delete_user"
    else
      flash[:danger] = t "pages.flash.delete_fail"
    end
    redirect_to users_url
  end

  private

  def user_params
    params
      .require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "pages.flash.please_login"
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    return if @user == current_user

    flash[:danger] = t "pages.edit.Wrong_user"
    redirect_to(root_url)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
