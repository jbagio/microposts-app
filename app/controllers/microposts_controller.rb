class MicropostsController < ApplicationController
  before_action :confirm_logged_in_user, only: %i[create destroy]
  before_action :confirm_correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:info] = 'Micropost created.'
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Micropost deleted.'
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def confirm_correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_back(fallback_location: root_url) if @micropost.nil?
  end
end
