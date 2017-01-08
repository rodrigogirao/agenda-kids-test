class SchoolsController < ApplicationController
  def show
    @school_unities = SchoolUnity.all
    @school_class_count = SchoolClass.count
    @teacher_count = Teacher.count
    @student_count = Student.count
    @responsible_count = Responsible.count
  end
end
