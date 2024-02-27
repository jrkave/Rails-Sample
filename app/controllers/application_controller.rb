class ApplicationController < ActionController::Base
    before_action :require_login
    helper_method :current_user

    private 

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end
      
      def require_login
        unless current_user
          flash[:error] = "You must be logged in to perform this action"
          redirect_to login_path
        end
      end
    end      

