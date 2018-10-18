class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  Refile.secret_key = 'a6b3f33f95d840479ccb5930b6aa5c14f438a1ad8418b864edf1ac4ad7f28aef1b24eed1169c8e29fe544a04efb68886729c32fb1c1c43070c5588418b5cd163'

  # log in後の飛び先
  # def user_root_path
  #   user_my_gallery_index_path(current_user.id)
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
