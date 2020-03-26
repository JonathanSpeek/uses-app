class ThingsController < ApplicationController
  
  def index
    @things = Thing.all
  end

  def show
    @thing = Thing.find(params[:id])
  end
  
  def new
    @thing = Thing.new
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def create
    @thing = Thing.new(thing_params)
  
    if @thing.save
      redirect_to @thing
    else
      render 'new'
    end
  end

  def update
    @thing = Thing.find(params[:id])
 
    if @thing.update(thing_params)
      redirect_to @thing
    else
      render 'edit'
    end
  end

  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    redirect_to things_path
  end
 
private
  def thing_params
    params.require(:thing).permit(:text, :link)
  end
end
