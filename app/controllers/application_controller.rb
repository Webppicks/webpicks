class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # ユーザがログインしていないと"show"にアクセスできない
  before_action :authenticate_user!, only: :show

  def index
  end

  def show
  end
end
