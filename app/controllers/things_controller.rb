class ThingsController < ApplicationController
  
  def index
    @things = Thing.all
  end

  def show
    @thing = Thing.find(params[:id])
  end
  
  def new
  end

  def edit
  end

  def create
    @thing = Thing.new(thing_params)
  
    @thing.save
    redirect_to @thing
  end

  def update
  end

  def destroy
  end
 
private
  def thing_params
    params.require(:thing).permit(:text, :link)
  end
end
