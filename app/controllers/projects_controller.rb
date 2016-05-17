class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		 if params[:client_id]
         @projects = client.projects.where('client_id = ?',params[:client_id]) 
     else 
     	@projects = Client.all
     end
     render layout: 'application'
	end

	def new
		@projects = Project.new
	end

	def create
	    @project = Project.new(project_params)
	  if @project.save
	    redirect_to projects_path,notice: "Successfully created the project"
	  else
	  render "new"
	  end
	end
	def show
		@project = Project.find(params[:id])
		@task = Task.new
	end

	private

	def project_params
	params[:project].permit(:client_id,:name,:description,:start_date,:status)	
    end
    	
end
