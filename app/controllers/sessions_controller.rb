class SessionsController < ApplicationController
  def new
  end
  #this is the login page. we havent made it yet

  #why dont we create an instance here?
  #only logging in not creating new user
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      #if user exists (by their email) and their password is authenticated
      #then create a session with :user_id as the key and this particular users id as its value
      session[:user_id] = user.id
      redirect_to products_url, notice: "You're logged in!"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "Logged out!"
  end


end
