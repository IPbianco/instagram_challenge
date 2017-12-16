class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render file: Rails.public_path.join("templates","SignUp.html")
  end

  def index
    render file: Rails.public_path.join("templates","LogIn.html")
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      render file: Rails.public_path.join("templates","SignUp.html")
    end
  end

  def show
    render file: Rails.public_path.join("templates","UserPage.html")
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
