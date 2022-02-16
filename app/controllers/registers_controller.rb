class RegistersController < ApplicationController
  def index
    @registers = Register.all
  end
  def new
    @registers = Register.new
  end

  def create
    @register = Register.new(params.require(:register).permit(:name_room, :int_room, :price, adress, :img_id))
    if @register.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :register
    else
      render"new"
    end
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
