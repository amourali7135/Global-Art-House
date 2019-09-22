class FollowsController < ApplicationController
  #copy + paste, check later.
  before_action :set_member

  def follow_member
    if current_member.follow @member.id
      respond_to do |format|
        format.html { redirect_to @member }
        format.js
      end
    end
  end

  def unfollow_member
    if current_member.unfollow @member.id
      respond_to do |format|
        format.html { redirect_to @member }
        format.js
      end
    end
  end

  def followers
    @followers = @member.followers
  end

  def following
    @followings = @member.following
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end
end
