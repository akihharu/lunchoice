class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if resource.provider == 'google_oauth2'
      resource.update_without_password(params)
    else
      super
    end
  end
end