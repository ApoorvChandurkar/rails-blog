class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index, :new, :create]
  before_action :require_same_user, only: [:update, :edit, :destroy]
  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5) #if articles.paginate, everything will be posted, so important point
  end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username} you have successfully signed up!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
   
  end

  def update
    

    if @user.update(user_params)
      flash[:notice] = "Your information was successfully updated"
      redirect_to @user
    else 
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if current_user == @user
    flash[:alert] = "Your account and all associated articles successfully deleted"
    redirect_to root_path()


  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user

    if @user != current_user && current_user.admin? == false
      flash[:alert] = "You can edit and delete only your profile information"
      redirect_to @user
    end

  end

end