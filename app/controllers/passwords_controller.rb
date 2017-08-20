class PasswordsController < ApplicationController

  def index
    if session[:verified] == true
      render 'static_pages/index'
    elsif session[:verified] == false
      render file: "#{Rails.root}/public/404.html", status: 404, layout: false
    else
      render 'index', layout: false
    end
  end

  def verify
    puts "Res: #{ENV['PASSWORDPROTECTED']}"
    if params[:password] == ENV['PASSWORDPROTECTED']
      session[:verified] = true
      redirect_to root_path
    else
      session[:verified] = false
      render file: "#{Rails.root}/public/404.html",  status: 404, layout: false
    end
  end
end