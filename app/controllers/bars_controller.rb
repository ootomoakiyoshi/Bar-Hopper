class BarsController < ApplicationController
  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.user_id = current_user.id
    if @bar.save
      redirect_to bars_path
    else
      render :new
    end
  end

  def index
    @bars = Bar.page(params[:page]).reverse_order
  end

  def show
    @bar = Bar.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @bar = Bar.find(params[:id])
    redirect_to bars_path if current_user.id != @bar.user.id
    @user = current_user
  end

  def update
    @bar = Bar.find(params[:id])
    if @bar.update(bar_params)
      redirect_to bar_path(@bar.id), notice: 'You have updated Bar successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to bars_path
  end

  private

  def bar_params
    params.require(:bar).permit(:bar_name, :image, :caption, :address, )
  end
end
