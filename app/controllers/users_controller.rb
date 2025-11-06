class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: {
        message: 'User creation failed',
        errors: user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone)
  end
end
