class FavoritesController < ApplicationController

def create
  @bar = Bar.find(params[:bar_id])
  favorite = current_user.favorites.new(bar_id: @bar.id)
  favorite.save
  # binding.pry
  # redirect_to bar_path(bar) 非同期通信の為。
end

def destroy
  @bar = Bar.find(params[:bar_id])
  favorite = current_user.favorites.find_by(bar_id: @bar.id)
  favorite.destroy
  # redirect_to bar_path(bar)　非同期通信の為。
end

end
