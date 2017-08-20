class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_alpha

  def check_alpha
    unless params[:she_said_yes] || session[:she_said_yes] || Rails.env.development?
      render(file: File.join(Rails.root, 'public/404.html'), status: 404, layout: false)
    else
      session[:she_said_yes] = true
    end
  end
end
