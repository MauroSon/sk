class SessionsController < ApplicationController
  # Exibir formulário de login
  def new
    # Redireciona para home se já estiver logado
    redirect_to home_path if logged_in?
  end

  # Processar autenticação
  def create
    username = params[:username]
    password = params[:password]

    # Credenciais hardcoded
    if username == "admin" && password == "12345"
      # Criar sessão do usuário
      session[:user_id] = "admin"
      session[:username] = username
      flash[:success] = "Login realizado com sucesso! Bem-vindo, #{username}!"
      redirect_to home_path
    else
      # Credenciais inválidas
      flash.now[:error] = "Usuário ou senha inválidos. Tente novamente."
      render :new, status: :unprocessable_entity
    end
  end

  # Realizar logout
  def destroy
    session[:user_id] = nil
    session[:username] = nil
    flash[:success] = "Logout realizado com sucesso!"
    redirect_to login_path
  end
end
