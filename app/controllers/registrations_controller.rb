
class RegistrationsController < ApplicationController

  # Guard clause, only allow if symbols are new & create
  allow_unauthenticated_access only: %i[ new create ]

  # For the signup form, creates a blank new user
  def new
    @user = User.new
  end

  # Save the new user, log them in, & redirect home.
  # OR re-show the form with errors.
  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Welcome to bergie_twitter!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Everything submitted in the request is filtered by key.
  # Only collects the specified fields, anything else gets dropped/ignored.
  private
    def user_params
      params.expect(user: [ :username, :email_address, :password, :password_confirmation ])
    end

end
