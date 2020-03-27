class ThingsController < ApplicationController
  before_action :find_thing, only: %i[show edit update destroy upvote undo_upvote]

  def index
    @things = Thing.where(user_id: current_user)
  end

  def show; end

  def new
    @thing = current_user.things.build
  end

  def edit; end

  def create
    @thing = current_user.things.build(thing_params)

    if @thing.save
      flash[:notice] = 'Huzzah! Saved your thing! 😜'
      redirect_to @thing
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      render 'new'
    end
  end

  def update
    if @thing.update(thing_params)
      flash[:notice] = 'Nice! Your thing was updated! 🙌'
      redirect_to @thing
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      render 'edit'
    end
  end

  def destroy
    if @thing.destroy
      flash[:notice] = "☠️ RIP: #{@thing.text}"
      redirect_to things_path
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      redirect_to @thing
    end
  end

  def upvote
    upvote = @thing.upvotes.find_or_create_by(user: current_user)
    upvote.save
    Thing.increment_counter(:up_votes, @thing.id)
    redirect_to things_path
  end

  def undo_upvote
    upvote = @thing.upvotes.find_by(user: current_user)
    upvote.destroy
    Thing.decrement_counter(:up_votes, @thing.id)
    redirect_to things_path
  end

  private

  def find_thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:text, :link)
  end
end
