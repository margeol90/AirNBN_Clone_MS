class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @flats = policy_scope(Flat).all # adding bundit stuff, "policy_scope()"
  end

  def new
    @flat = Flat.new
    authorize @flat # pundit stuff
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    authorize @flat # pundit stuff

    if @flat.save!
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat), notice: "Your flat has been succesfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @flat # pundit stuff

    @flat.destroy

    redirect_to flats_path, status: :see_other
  end

  # def users_flats
  # @flats = Flat.where(params[:current_user])
  # end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat # pundit stuff
  end

  def flat_params
    params.require(:flat).permit(:name, :rooms, :price, :photo)
  end
end
