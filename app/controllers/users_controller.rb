class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title,:star_daydate,:fin_day,:all_day,:memo))
    if @user.save
      flash[:notice] = "登録完了しました"

      redirect_to :users


    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :star_daydate, :fin_day, :all_day, :memo))
      flash[:notice] = "id「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :users
  end

end