class UsersController < ApplicationController
  def index
  	@users = User.all
  	@note = Note.find_by(user_id: params[:user_id])
  end

  def show
  	@user = User.find(params[:id])
  	@notes = @user.notes.page(params[:page])
  	@note = Note.find_by(user_id: params[:user_id])
  	
  end
end
