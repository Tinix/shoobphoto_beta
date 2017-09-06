class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_to do |format|
      if @project.save
        redirect_to new_porder_path(@project.id)
      else
        format.html {render :new, :project => @project}
      end
    end
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:school, :email, :name, :position, :phone, :delivery, :flexible, :project_prints_attributes => [:id, :project_id, :print_id, :quantity, :description, :file, :image])
    end
end