class ItemsController < Api::ApiController
	before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]
  has_scope :by_done

  def index
    render_success apply_scopes(@todo.items)
  end

  def show
    render_success(@item)
  end

  def create
    @item = @todo.items.new(item_params)
    return render_success(@todo) if @item.save
    render_unprocessable_entity_error(@item.errors.full_message)
  end

  def update
    @item.update(item_params)
    render_no_content
  end

  def destroy
    @item.destroy
    render_no_content
  end

  private

  def item_params
    params.permit(:name, :done, :todo_id, :id)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_item
    @item = @todo.items.find_by(id: params[:id])
  end
end
