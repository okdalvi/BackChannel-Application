class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy, :make_admin, :revoke_admin]
  
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"	
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @post1= Post.find_all_by_user_id(@user.id)
    @post1.each do |post|
      post.user_id=999
      post.save
    end
    @user.destroy
    #flash[:success] = "User Deleted."
    redirect_to users_url, :notice => "User Deleted."
  end

  def make_admin
    @user = User.find(params[:id])
    @user.update_attribute(:admin , 1)
    @user.save
    redirect_to users_path, :notice => "User has been made admin"
=begin
    if @user.save !=false
      redirect_to users_path, :notice => "User has been made admin"
    else
      redirect_to users_path, :notice => "User has not been saved"
    end
=end
  end

  def revoke_admin
    @user = User.find(params[:id])
    @user.update_attribute(:admin , 0)
    @user.save
    redirect_to users_path, :notice => "Admin rights have been revoked for the user"
=begin
    if @user.save != false
      redirect_to users_path, :notice => "Admin rights have been revoked for the user"
    else
      redirect_to users_path, :notice => "User has not been saved"
    end
=end
  end

  def report
    @users = User.all
  end

  private

    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
