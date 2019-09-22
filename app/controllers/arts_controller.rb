class ArtsController < ApplicationController
  def index
    @arts = Art.all
  end
  #   def index
  #   if !logged_in?
  #     @posts = Post.all.order('created_at DESC').take(10)
  #   else
  #     @posts = Post.posts_of_followings(current_user.following)
  #     @posts = @posts.concat(current_user.posts)
  #     @posts = @posts.sort_by(&:'created_at')
  #     @posts = @posts.reverse.take(10)
  #   end
  # end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new
    @member = Member.find(params[:member_id])
    @art.member = @art
    if @art.save
      redirect_to member_arts_path(@member, @art)
    else
      render :def new
    end
  end

  def show
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])
    if @art.update(art_params)
      redirect_to @art
    else
      render 'edit'
    end
  end

  def destroy
    @art = Art.find(params[:id])
    @art.destroy
    redirect_to arts
  end

  def edit
    @art = Art.find(params[:id])
  end

  private

  def art_params
    params.require(:art).permit(:title, :photo, :description, :completion_date, :inspiration, :available, :price_cents)
  end
end
