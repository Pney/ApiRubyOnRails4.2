class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  def show
    if @user
      render json: @user
    else
      render json @user.errors
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render json: @user, status: :ok, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user.destroy
      render json: {done: "O usuario #{@user.name} foi excluido com sucesso"}
    else
      render json: @user.error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      begin
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {error: "Usuário não encontrado"}, status: :not_found
      rescue => exception
        render json: {error: "Erro desconhecido: #{exception.message}"}, status: :internal_server_error
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :idade)
    end
end