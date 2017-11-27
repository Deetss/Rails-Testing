#---
# Excerpted from "Rails 5 Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrtest3 for more book information.
#---
class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def create
    @workflow = CreatesProject.new(
      name: params[:project][:name],
      task_string: params[:project][:tasks])
    @workflow.create
    redirect_to projects_path
  end
end
