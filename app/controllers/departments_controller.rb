class DepartmentsController < ApplicationController
  before_action :find_department_id, only: [:show, :edit, :update, :delete, :destroy]
  def index
    @departments = Department.sorted
  end

  def show ; end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = t('.dept_create')
      redirect_to(departments_path)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @department.update_attributes(department_params)
      flash[:notice] = t('.dept_edit')
      redirect_to(departments_path(@department))
    else
      render :edit
    end
  end

  def delete; end

  def destroy
    @department.destroy
    flash[:notice] = t('.dept_delete')
    redirect_to(departments_path)
  end

  private
  def department_params
    params.require(:department).permit(:name, :position, :head_name, :description, :capacity)
  end
  def find_department_id
    @department = Department.find(params[:id])
  end
end
