class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
    
    def user_params
    end
end
