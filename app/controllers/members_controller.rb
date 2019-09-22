class MembersController < ApplicationController
  # Did I even need this?  Or is it all in the user?
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[:id])
    user = current_user
    if @member.save
      redirect_to dashboard_path
    else
      render "new"
    end
  end

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to @member
    else
      render 'edit'
    end
  end

  def delete
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to members
  end

  def edit
    @member = Member.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit( :first_name, :last_name, :email, :photo, :artist_name, :photo, :bio, :age, :birth_country, :languages_spoken, :instagram, :facebook, :website)
  end
end

end
