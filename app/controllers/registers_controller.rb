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
    @register = Register.all
  end

  def edit
  end
  def search
    @q = Register.search(search_params)
    @results = @q.result(distinct: true)
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
