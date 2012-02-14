# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, :with => :render_404

  cattr_accessor :service_manager

  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  private

  def service_manager
    ApplicationController.service_manager || ServiceManager
  end

  def core_service
    service_manager.core_service
  end
end
