class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  	@incomplete_tasks = Todo.incomplete_task
  	@complete_tasks = Todo.complete_task
  end
  def new_task
  	@task = Todo.new(:is_use=>true); 
  end

  def add
  	@task = Todo.new(task_params);
  	if(@task.save)
      @incomplete_tasks = Todo.incomplete_task
      @complete_tasks = Todo.complete_task
  		respond_to do |format|
  			format.html { redirect_to(:action=>"index")}
  			format.js
  		end
  	end
  end

  def update
    @task = Todo.find(params[:id]);
    if @task.update_attributes(task_params2)
      @incomplete_tasks = Todo.incomplete_task
      @complete_tasks = Todo.complete_task
      @data = "alert me"
      respond_to do |format|
        format.html { redirect_to(:action=>"index")}
        format.js
      end
    end
  end

  
  def remove
    @task = Todo.find(params[:id]);
    if @task.destroy
      respond_to do |format|
        format.html { redirect_to(:action=>"index")}
        format.js
      end
    end
  end

  private 
    def task_params
      params.require(:task).permit(:title, :content, :is_use);
    end

    def task_params2
      params.permit(:is_use);
    end
end
