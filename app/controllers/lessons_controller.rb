class LessonsController < ApplicationController
	before_action :require_enrollment_for_current_lesson, :only => [:show]

	def show
	end

	private

	def require_enrollment_for_current_lesson
		this_course = current_lesson.section.course
		if !current_lesson.section.course.user.enrolled_in?(this_course)
			redirect_to courses_path(this_course), :alert => 'Please Enroll For Access to Lessons'
		end
	end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
end
