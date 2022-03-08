class ReservesController < ApplicationController
  def index
    register = params[:register_id]
    @register = Register.find_by(id: register)
    session.delete(:reserve)
    @reserve = Reserve.new
  end

  def new
    session.delete(:reserve)
    @reserve = Reserve.new
  end

  def back
    @reserve = Reserve.new(session[:reserve])
		session.delete(:reserve)
    register = params[:register_id]
    binding.pry
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
    @reserve = Reserve.create!(session[:reserve])
    session.delete(:reserve)
      if @reserve.save
        flash[:notice] = "スケジュールを登録しました"
        redirect_to reserves_complete_path

      else
        session.delete(:reserve)
        render :index
      end
  end

  def show
    @reserves = Reserve.all.includes(:register)
  end

  def edit
  end

  def update
  end

  def destroy
    @reserve = Reserve.find(params[:id])
      @reserve.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to reserves_complete_path
  end
end
