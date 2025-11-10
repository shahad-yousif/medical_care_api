class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        message: 'User created successfully',
        user: {
          id: resource.id,
          name: resource.name,
          email: resource.email,
          phone: resource.phone
        }
      }, status: :created
    else
      render json: {
        message: 'User creation failed',
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :phone)
  end
end
