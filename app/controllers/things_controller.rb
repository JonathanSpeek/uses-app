class ThingsController < ApplicationController
  before_action :find_thing, only: %i[show edit update destroy upvote undo_upvote add_to_wishlist]

  def index
    @things = Thing.where(user_id: params[:user_id]).where(wish_list: false).order('num_up_votes DESC')
    @wish_list = Thing.where(user_id: params[:user_id]).where(wish_list: true).order('num_up_votes DESC')
    @user = User.find(params[:user_id])
  end

  def show; end

  def new
    @thing = current_user.things.build
  end

  def edit; end

  def create
    @thing = Thing.new thing_params
    @thing.user_id = current_user.id

    if @thing.save
      flash[:notice] = 'Huzzah! Saved your thing! 😜'
      redirect_to things_path(user_id: current_user)
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      render 'new'
    end
  end

  def update
    if @thing.update(thing_params)
      flash[:notice] = 'Nice! Your thing was updated! 🙌'
      redirect_to things_path(user_id: current_user)
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      render 'edit'
    end
  end

  def destroy
    if @thing.destroy
      flash[:notice] = "☠️ RIP: #{@thing.text}"
      redirect_to things_path(user_id: current_user)
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      redirect_to things_path(user_id: current_user)
    end
  end

  def upvote
    upvote = @thing.upvotes.find_or_create_by(user: current_user)
    if upvote.save
      Thing.increment_counter(:num_up_votes, @thing.id)
      flash[:notice] = "Someone's feeling the love 🥰"
      redirect_to root_path
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      redirect_to root_path
    end
  end

  def undo_upvote
    upvote = @thing.upvotes.find_by(user: current_user)
    if upvote.destroy
      Thing.decrement_counter(:num_up_votes, @thing.id)
      flash[:notice] = "Guess you didn't really like that thing 🥺"
      redirect_to root_path
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      redirect_to root_path
    end
  end

  def add_to_wishlist
    @thing = Thing.new thing_params
    @thing.user_id = current_user.id

    if @thing.save
      flash[:notice] = 'Huzzah! Saved your thing! 😜'
      redirect_to things_path(user_id: current_user)
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      render 'new'
    end
  end

  private

  def find_thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:text, :link, :wish_list, :user_id)
  end
end
