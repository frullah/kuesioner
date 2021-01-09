class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_forbidden

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  private

  def user_forbidden
    flash[:error] = "Anda tidak mempunyai hak akses."
    redirect_to(request.referrer || root_path)
  end
end
