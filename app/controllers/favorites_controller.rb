class FavoritesController < ApplicationController

def create
  bar = Bar.find(params[:bar_id])
  favorite = current_user.favorites.new(bar_id: bar.id)
  favorite.save
  redirect_to bar_path(bar)
end

def destroy
  bar = Bar.find(params[:bar_id])
  favorite = current_user.favorites.find_by(bar_id: bar.id)
  favorite.destroy
  redirect_to bar_path(bar)
end

end
