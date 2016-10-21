# registrations_controller.rb
# Overrides default Devise::RegistrationsController to allow users to register users

class RegistrationsController < Devise::RegistrationsController
  # disable default no_authentication action
  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]


  def edit
    @usuario = Usuario.find(params[:id])
  end

  protected

  # The default sign_up method signs in new user upon creation
  # I just commented it out so you can see what the default method looks like
  def sign_up(resource_name, resource)
    # sign_in(resource_name, resource)
  end

  def sign_up_params
    params.require(:usuario).permit(:admin, :email, :password, :password_confirmation)
  end

  def account_update_params
  params.require(:usuario).permit(:admin, :email, :password, :password_confirmation, :current_password)
  end
end
