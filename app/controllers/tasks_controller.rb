class TasksController < ApplicationController
	def 
		@task = Task.new
	end
	def create 
		@task =Task.new(task_params)
         if @task.save
		redirect_to project_path(@task.project_id),notice: "Successfully created"
	else 
		render "new"
	end
	end

	def mark_as_complete
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: true)
		Notification.mark_as_complete(@task).deliver!
		redirect_to :back, notice: "Marked as complete"
	end

	private

	def task_params
	params[:task].permit(:name,:project_id,:is_completed,:due_date)
	end

end

