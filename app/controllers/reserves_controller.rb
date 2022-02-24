class ReservesController < ApplicationController
  def index
    session.delete(:register)
    session.delete(:reserve)
    @reserve = Reserve.new
    @register = Register.find(1)
    session[:register] = @register.price
  end
  def new
    session.delete(:reserve)
    @reserve = Reserve.new
  end

  def back
    @register = Register.find(1)
		@reserve = Reserve.new(session[:reserve])
		session.delete(:reserve)
		render :index
  end

  def confirm
		@reserve = Reserve.new(params.require(:reserve).permit(:start_day,:end_day,:guest,:fee,:register_id,:user_id))
		session[:reserve] = @reserve
		if @reserve.invalid?
			render :index
		end
	end

  def create
    @user = current_user.id
    @register = Room.find(1)

    @reserve = Reserve.new(params.require(:reserve).permit(:start_day,:end_day,:guest,:fee,:register_id,:user_id))
      if @reserve.save
        flash[:notice] = "スケジュールを登録しました"
        session.delete(:reserve)
        redirect_to :registers

      else
        session.delete(:reserve)
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
