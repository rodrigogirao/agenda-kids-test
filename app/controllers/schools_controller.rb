class SchoolsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @school = current_user.school
    @school_unities = SchoolUnity.all
    @school_class_count = SchoolClass.count
    @teacher_count = Teacher.count
    @student_count = Student.count
    @responsible_count = Responsible.count
  end
end
