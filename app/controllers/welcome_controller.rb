class WelcomeController < ApplicationController
  def index
    @things = Thing.all.order('num_up_votes DESC')
  end
end
