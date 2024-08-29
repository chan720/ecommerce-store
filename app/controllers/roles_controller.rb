class RolesController < ApplicationController
  def new
  end
  def create
    current_user.update(role: params[:role])
    redirect_to root_path, notice: "Your role has been set"
  end
end
