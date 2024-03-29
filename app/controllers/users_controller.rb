class UsersController < ApplicationController
 
  before_filter :require_login
 
  def index
    @users = User.all
  end

  
  def show
    @user = User.find(params[:id])
  end

 
  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end

 
  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, :notice => 'User was successfully created.' 
    else
      render :new
    end
  end

 
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => 'User was successfully updated.'
    else
      render :edit
    end
  end

 
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
