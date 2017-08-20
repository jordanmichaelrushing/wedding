class StaticPagesController < ApplicationController
  def index
    if session[:verified].nil?
      redirect_to root_path, layout: false
    elsif session[:verified] == false
      render file: "#{Rails.root}/public/404.html",  status: 404, layout: false
    end
  end
end