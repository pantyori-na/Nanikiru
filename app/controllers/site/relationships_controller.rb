class Site::RelationshipsController < Site::Base
before_action :set_user

  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:info] = 'ユーザーをフォローしました'
      redirect_to user
    else
      flash.now[:danger] = 'ユーザーのフォローに失敗しました'
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:info] = 'ユーザーのフォローを解除しました'
      redirect_to user
    else
      flash.now[:danger] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user
    end
  end

  private
  def set_user
    user = User.find(params[:follow_id])
  end

end