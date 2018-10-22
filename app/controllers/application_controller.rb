class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  Refile.secret_key = 'a6b3f33f95d840479ccb5930b6aa5c14f438a1ad8418b864edf1ac4ad7f28aef1b24eed1169c8e29fe544a04efb68886729c32fb1c1c43070c5588418b5cd163'

  # abputにでも飛ばすか
  # def after_sign_up_path_for(resource)
  #   front_member_path(resource)
  # end

  def after_sign_in_path_for(resource)
    case resource
    when User
      user_my_gallery_index_path(resource)
    when Admin
      admin_works_path(resource)
    end
  end

  def after_sign_out_path_for(resource)
    new_member_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
