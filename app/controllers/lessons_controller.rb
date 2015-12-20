class LessonsController < ApplicationController
	#before_action :require_enrollment_for_current_lesson

	def show
	end

	private

	#def require_enrollment_for_current_lesson
		#if current_lesson.section.course.user != current_user
		#	return render :text => 'Unauthorized', :status => :Unauthorized
		#end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
end
