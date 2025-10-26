class HomeController < ApplicationController
  # Protege a rota home - requer autenticação
  before_action :require_login

  def index
    # Página inicial após login
  end
end
