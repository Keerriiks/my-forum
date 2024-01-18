class AllUsersController < ApplicationController
  def index
    @users = User.all
  end

  def change_role
    user = User.find(params[:id])
    user.role = params[:new_role]
    user.save!
  end
end
