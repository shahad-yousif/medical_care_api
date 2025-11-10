class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def create
    user = User.new(user_params)
    p "++++++++++++++++++++"
    p user
    if user.save
      p "______________"
      p user
      render json: UserSerializer.new(user), status: :created
    else
      # render json: {
      #   message: 'User creation failed',
      #   errors: user.errors.full_messages
      # }, status: :unprocessable_entity

      errors_messages = []
      user.errors.each { |error| errors_messages << {field_name: error.attribute, details: error.message} }
      render json: {status: false , errors: errors_messages}, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone)
  end
end
