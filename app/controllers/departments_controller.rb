class DepartmentsController < ApplicationController


  def index
    @departments = Department.sorted
    render (:index)
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:notice] = "Department created successfully!"
      redirect_to(departments_path)
    else
      render(:new)
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(department_params)
      flash[:notice] = "Department updated successfully!"
      redirect_to(departments_path(@department))
    else
      render('edit')
    end
  end

  def delete
    @department = Department.find(params[:id])
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    flash[:notice] = "Department '#{@department.name}' destroyed successfully!"
    redirect_to(departments_path)
  end

  private
  def department_params
    params.require(:department).permit(:name, :position, :head_name, :description, :capacity)
  end

end
