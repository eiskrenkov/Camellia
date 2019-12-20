class Admin::UsersController < AdminController
  defaults resource_class: User

  def create
    User.create!( 
      email: user_params[:email], 
      password: user_params[:password], 
      password_confirmation: user_params[:password]
    )
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
