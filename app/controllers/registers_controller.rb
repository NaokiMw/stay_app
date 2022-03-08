class RegistersController < ApplicationController
  before_action :search

  def index
    @user = current_user.id
    @registers = Register.where(user_id: @user)
    
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
    @register = Register.all
  end

  def edit
  end
  def search
    @register = Register.all

  end

  def update
  end

  def destroy
    @register = Register.find(params[:id])
      @register.destroy
      flash[:notice] = "ルーム情報を削除しました"
      redirect_to :registers
  end

  private
  def register_params
    params.require(:register).permit(:name_room, :int_room, :price, :adress, :image, :user_id)
  end

  def search_params
    params.require(:q).permit(:address_cont, :name_room_or_int_room_or_address_cont)
  end
end
