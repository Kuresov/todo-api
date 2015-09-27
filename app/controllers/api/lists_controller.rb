class Api::ListsController < ApiController

  def index
    @lists = User.find(params[:user_id]).lists
    @lists.each do |list|
      authorized? @lists
    end

    render :index, locals: { lists: @lists }
  end

  #POST /api/users/:user_id/lists
  def create
    user = User.find(params[:user_id])
    authorized? user
    @list = user.lists.build(list_params)

    if @list.save
      render :create, locals: { list: @list }
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @list = List.find(params[:id])
    authorized? @list

    if @list.update(update_list_params)
      render :update, locals: { list: @list }
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #DELETE /api/users/:user_id/lists/:id
  def destroy
    begin
      list = List.find(params[:id])
      authorized? list

      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
  end

  private

  def list_params
    params.require(:list).require(:title)
    params.require(:list).permit(:title, :permissions)
  end

  def update_list_params
    params.require(:list).permit(:title, :permissions)
  end
end
