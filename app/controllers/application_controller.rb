class ApplicationController < ActionController::Base

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def require_user
        redirect_to '/login' unless current_user
    end

    def require_author
        redirect_to '/login' unless current_user.author?
    end

    def require_commenter
        redirect_to '/login' unless current_user.commenter?
    end
end
