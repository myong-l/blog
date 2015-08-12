class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@users = User.all
  	@user = User.find(params[:id])
  	@note = Note.find_by(user_id: params[:user_id])
  end
end
