class CommentsController < ApplicationController
  #make so only for user comments?
  def def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @comment.art_id = params[:art_id]
  end

  def create
    @comment = Comment.new
    @art = Art.find(params[:art_id])
    @art.comment = @art
    if @comment.save
      redirect_to member_arts_path(@member, @art)
    else
      render "new"
    end
  end

  def show
    @art = Art.find(params[:art_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update()
    end

    def destroy
      @comment = Comment.find(params[:id])
      art = @comment.art
      @comment destroy
      redirect_to @art
      respond_to do |format|
        format.html { redirect_to post, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content } #this is what?
      end
    end

    def edit
      @comment = Comment.find(params[:id])
      @art = Art.find(params[:art_id])
    end

    private

    def comment_params
      params.require(:comment).permit(:content, :member_id, :art_id)
    end
  end
