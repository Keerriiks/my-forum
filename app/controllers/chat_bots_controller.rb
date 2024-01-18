class ChatBotsController < ApplicationController
  def index
    user_message = params[:message]
    @bot_response = ChatBot.r_to(user_message)
    respond_to do |format|
      format.json { render json: { bot_response: @bot_response } }
      format.html 
    end
  end
end