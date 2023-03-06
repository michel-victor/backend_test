class SeasonsController < ApplicationController
  def index
    # Ordered by createed_at and episodes ordered by its number from default_scope in model
    @seasons = Season.all #Ordered by createed_at from default_scope in model
  end
end
