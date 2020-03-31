class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Nice! Your profile was updated! 🙌'
      redirect_to things_path(user_id: current_user)
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      render 'edit'
    end
  end

  def destroy; end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:github_url, :twitter_url, :websit_url, :user_id)
  end
end