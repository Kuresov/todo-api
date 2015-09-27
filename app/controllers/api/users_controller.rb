class Api::UsersController < ApiController

  # This is mostly for testing- a production app would return @authorized_user
  def index
    @users = User.all
    render :index, locals: { users: @users }
  end

  def show
    @user = User.find(params[:id])
    authorized? @user
    @lists = @user.lists
    render :show, locals: { user: @user, lists: @lists }
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      render :create, locals: { user: @user }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      authorized? user

      user.destroy

      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
