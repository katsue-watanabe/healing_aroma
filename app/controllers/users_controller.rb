class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :todays_reservations]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy, :todays_reservations]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :index, :todays_reservations] 
  
  def index
    @users = User.paginate(page: params[:page], per_page: 10).order("id ASC")
  end
  
  def show
    @user_reservations = @user.reservations.where("day >= ?", Date.current).order(day: :desc)
    @visit_historys = @user.reservations.where("day < ?", Date.current).where("day > ?", Date.today << 12).order(day: :desc)
  end
  
  def new
    @user = User.new # ユーザーオブジェクトを生成し、インスタンス変数に代入します。
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規のご登録ありがとうございます。'
      redirect_to @user
    else
      render :new
    end
  end
    
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "お客様情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def todays_reservations
    @users = User.all.includes(:reservations)
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # beforeフィルター
    # paramsハッシュからユーザーを取得します。
    def set_user
      @user = User.find(params[:id])
    end

    # ログイン済みのユーザーか確認します。
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
    # アクセスしたユーザーが現在ログインしているユーザーか確認します。
    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # システム管理権限所有かどうか判定します。
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
