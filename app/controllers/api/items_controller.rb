class Api::ItemsController < ApiController

  def create
    list = List.find(params[:list_id])
    @item = list.items.build(item_params)
    authorized? list

    if @item.save
      render :create, locals: { item: @item }
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    authorized? @item

    if @item.update(item_update_params)
      render :update, locals: { item: @item }
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).require(:body)
    params.require(:item).permit(:body)
  end

  def item_update_params
    params.require(:item).permit(:body, :completion)
  end
end
