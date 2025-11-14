class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Helpers de autenticação
  helper_method :current_user, :logged_in?

  # Retorna o usuário atual se estiver logado
  def current_user
    @current_user ||= session[:username] if session[:user_id]
  end

  # Verifica se o usuário está logado
  def logged_in?
    !current_user.nil?
  end

  # Protege rotas que requerem autenticação
  def require_login
    unless logged_in?
      flash[:error] = "Você precisa estar logado para acessar esta página."
      redirect_to login_path
    end
  end
end
