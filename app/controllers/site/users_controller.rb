class Site::UsersController < Site::Base
	skip_before_action :authenticate_user!, only: [:welcome]
	def	index
		@users = User.all
	end
	def show
		 @user = User.find(params[:id])
		 @report = Report.new
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

	def following_index
		@user = User.find(params[:user_id])
	end

	def follow_nanikiru
		@user = User.find(params[:user_id])
		# userがfollowしているユーザーの投稿したimages
		@follow_post_images = @user.follow_images
		@post_images = Kaminari.paginate_array(@follow_post_images).page(params[:page]).per(12)
	end

	def follower_index
		@user = User.find(params[:user_id])
	end
	def welcome
	end
private
def user_params
    params.require(:user).permit(:name, :profile_image, :dan_4p_proper, :dan_3p_proper, :introduction)
end
end