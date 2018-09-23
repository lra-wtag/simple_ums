class DepartmentsController < ApplicationController
  before_action :find_school_id
  before_action :find_department_id, only: [:show, :edit, :update, :delete, :destroy]
  def index
    @departments = @school.departments.sorted
  end

  def show ; end

  def new
    @department = Department.new(:school_id => @school.id)
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = t('.dept_create')
      redirect_to(departments_path(:school_id => @school.id))
    else
      render :new
    end
  end

  def edit; end

  def update
    if @department.update_attributes(department_params)
      flash[:notice] = t('.dept_edit')
      redirect_to(departments_path(@department,:school_id => @school.id))
    else
      render :edit
    end
  end

  def delete; end

  def destroy
    @department.destroy
    flash[:notice] = t('.dept_delete')
    redirect_to(departments_path(:school_id => @school.id))
  end

  private
  def department_params
    params.require(:department).permit(:school_id, :name, :position, :head_name, :description, :capacity)
  end
  def find_department_id
    @department = Department.find(params[:id])
  end
  def find_school_id
    if params[:school_id]
      @school = School.find(params[:school_id])
    end
  end
end
