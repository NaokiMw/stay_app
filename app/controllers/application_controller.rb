class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller? 

  private
    #deviseのストロングパラメータをnameに変更した為、Emailをストロングパラメータに追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) 
end
end