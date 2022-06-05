class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    # 直前のページにリダイレクト。もし戻れなかったらroot_path に案内される
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
    # redirect_to root_path
  end
end
