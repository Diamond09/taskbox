class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to students_path,notice: "Record not found"
	end
	end

	def new
		@student = Student.new
	end
		
	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path ,notice: "Student was successfully created"
		else 
			render "new"
		end
	end		

	def destroy
		@student = Student.find(params[:id])
		@student.destroy
		redirect_to students_path,notice: "Successfully deleted the student"
	end







	private

	  def student_params
		params[:student].permit(:name,:email,:deleted_at)
	  end	
