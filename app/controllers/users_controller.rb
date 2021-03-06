class UsersController<ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  before_action :find_user, only: [:show,:edit,:update,:destroy]

  def index
    @users= User.all
  end

  def show

  end

  def new
    @user=User.new
  end

  def create
    @user=User.create(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      render:new
    end
  end

  def edit

  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      render:edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def find_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:username,:password)
  end

end
