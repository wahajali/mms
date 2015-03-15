class UsersController < ApplicationController

  def add
    @user = User.new 
    respond_to do |format|
        format.html { render 'devise/registrations/new' }
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
      else
        format.html { render 'devise/registrations/new' }
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit!
  end
end
