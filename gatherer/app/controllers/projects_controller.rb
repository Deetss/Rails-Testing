class ProjectsController < ApplicationController
    def index
       @projects = Project.all 
    end
    
    def new
        @project = Project.new
    end
    
    def create
        @workflow = CreatesProject.new(name: params[:project][:name],
                                       task_string: params[:project][:tasks])
        if @workflow.create
            redirect_to projects_path
        else
            @project = @workflow.project
            render :new
        end
    end
end