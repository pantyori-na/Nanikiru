class Site::UsersController < Site::Base
	def	index
	end
  def show
  end
	def edit
    @user = User.find(params[:id])
  end
	def update
		@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
	end
	def leave
	end
	def destroy
	end
private
def user_params
    params.require(:user).permit(:name, :profile_image, :dan_4p_proper, :dan_3p_proper, :introduction)
end
end