class TasksController < ApplicationController
  before_action :check_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def sort
    params[:order].each do |key,value|
      Task.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    @task.update(task_params)
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    # redirect_to task, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :due_on, :priority, :completed, :user_id)
    end
end
