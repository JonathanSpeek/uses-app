class WelcomeController < ApplicationController
  def index
    @things = Thing.all.order('up_votes DESC')
  end
end
