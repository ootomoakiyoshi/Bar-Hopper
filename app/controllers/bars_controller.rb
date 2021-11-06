class BarsController < ApplicationController

def new
  @bar =Bar.new
end

def create
  @bar = Bar.new(bar_params)
  @bar.user_id = current_user.id
  @bar.save
  redirect_to bars_path
end

def index
  @bars = Bar.all
end

def show
 @bar = Bar.find(params[:id])
end

def destroy
 @bar = Bar.find(params[:id])
 @bar.destroy
 redirect_to bars_path
end


private

def bar_params
  params.require(:bar).permit(:bar_name, :image, :caption)
end

end
