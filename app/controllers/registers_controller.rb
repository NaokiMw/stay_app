class RegistersController < ApplicationController

  def index
    @registers = Register.all
    @users = User.all
  end
  def new
    @user = current_user.id
    @register = Register.new
  end

  def create
    @register = Register.new(register_params)
    if @register.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :registers
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

  private
  def register_params
    params.require(:register).permit(:name_room, :int_room, :price, :adress, :image, :user_id)
  end
end
