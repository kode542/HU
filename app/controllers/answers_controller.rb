class AnswersController < ApplicationController

	def create
		question = Question.find(params[:answer][:question_id]) #Find the question with this question_id
		answer = question.answers.create(answer_params) #Find the answers of this question and create another answer with answer_params

		MainMailer.notify_question_author(answer).deliver_later

		session[:current_user_email] = answer_params[:email] #Save users email into session
		redirect_to question #Redirect to the page of that question
	end

	private

	def answer_params
		params.require(:answer).permit(:email, :body) #Requires an answer object and allows 2 params
	end

end
