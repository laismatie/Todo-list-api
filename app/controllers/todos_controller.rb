class TodosController < Api::ApiController
 before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
    render_success(@todos)
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)
    return render_success(@todo) if @todo.save
    render_unprocessable_entity_error(@todo.errors.full_messages)
  end

  # GET /todos/:id
  def show
     render_success(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    render_no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    render_no_content
  end

  private

  # remove `created_by` from list of permitted parameters
  def todo_params
    params.permit(:title, :id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
