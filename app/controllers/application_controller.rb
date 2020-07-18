class ApplicationController < ActionController::Base
  def admin_required
    redirect_to '/', alert: 'You are not admin.' unless current_user.is_admin?
  end
end
