class ReservesController < ApplicationController
  def index
    @reserve = Reserve.new
    @register = Register.find(1)
  end
  def new
    @reserve = Reserve.new
  end

  def create
    @user = current_user.id
    @register = Room.find(1)

    @reserve = Reserve.new(params.re1uire(:reserve).permit(:start_day,:end_day,:guest,:room_id,:user_id))
      if @reserve.save
        flash[:notice] = "スケジュールを登録しました"
        redirect_to :registers
      else
        render "index"
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
