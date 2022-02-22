class ReservesController < ApplicationController
  def index
    @reserve = Reserve.all
  end
  def new
    @register = Register.find_by(params[:id])
    @reserve = Reserve.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
