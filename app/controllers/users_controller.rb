class UsersController < ApplicationController
  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.save
  # end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private

  # def user_params
  #   params.require(:user).permit(:nickname, :email)
  # end

end
