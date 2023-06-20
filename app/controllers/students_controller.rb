class StudentsController < ApplicationController
  def index
    if params[:name]
      query = "%#{params[:name]}%"
      students = Student.where("first_name LIKE ? OR last_name LIKE ?", query, query)
    else
      students = Student.all
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
