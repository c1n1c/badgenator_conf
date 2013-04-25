# coding: utf-8

class ApplicationController < ActionController::Base
  Exceptions_404 = [
    ActionController::RoutingError,
    ActionController::UnknownController,
    ::AbstractController::ActionNotFound,
    ActiveRecord::RecordNotFound,
  ]

  protect_from_forgery

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception do |exception|
      render_error 500, exception
    end
    rescue_from *Exceptions_404 do |exception|
      render_error 404, exception
    end
  end

  private

  def render_error(status, exception)
    respond_to do |format|
      format.html { render :template => "errors/error_#{status}", :layout => 'layouts/application', :status => status }
      format.all { render :nothing => true, :status => status }
    end
  end
end
