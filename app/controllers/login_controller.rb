class LoginController < ApplicationController

  def new
  end

  def create
    flash[:success] = "Thanks for logging in, #{params[:email]}!"
    redirect_to :login
  end

end
