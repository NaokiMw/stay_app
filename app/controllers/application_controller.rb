class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
    def set_search
      @users = User.all
      @q = Register.ransack(params[:q])
      @results = @q.result(distinct: true)
    end

  private
    #deviseのストロングパラメータをnameに変更した為、Emailをストロングパラメータに追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
    end

end

