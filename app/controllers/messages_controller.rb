class MessagesController < ApplicationController
	 

	def create
		@question = Question.find(params[:question_id])
		@message = @question.messages.create(question_params)
		redirect_to question_path(params[:question_id])
	end

	private
		def question_params
			params.require(:message).permit(:message_body)
		end
end
