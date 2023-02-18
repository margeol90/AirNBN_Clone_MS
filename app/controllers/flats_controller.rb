class FlatsController < ApplicationController
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save!
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

<<<<<<< HEAD
  def show
    @flat = Flat.find(params[:id])
  end

=======
>>>>>>> master
  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to root_path
    # waiting for show page to redirect
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :rooms, :price)
  end
end
