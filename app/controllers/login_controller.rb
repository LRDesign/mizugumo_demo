class LoginController < ApplicationController

  def new
  end

  def create
    flash[:success] = "Thanks for signing, #{params[:name]}!"
    redirect_to :login
  end

end
