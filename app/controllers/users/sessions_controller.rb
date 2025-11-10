class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: 'Logged in successfully',
      user: {
        id: resource.id,
        name: resource.name,
        email: resource.email,
        phone: resource.phone
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: { message: 'Logged out successfully' }, status: :ok
    else
      render json: { message: 'No active session' }, status: :unauthorized
    end
  end

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end