class UsersController < ApplicationController
  def index
    if params[:name].present?
      @users = User.where(name: params[:name])
    else
      @users = User.all
    end

    render json: @users
  end

  def create
    user_params = params.require(:user).permit(:name, :phone, address: [ :postcode, :city ])

    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
