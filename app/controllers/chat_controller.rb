class ChatController < ApplicationController
  require 'chat'

  def index
    @prompt = params[:prompt] || "Type in your explanation below."
    
    if params[:concept_id] && params[:i_knew_this] == "TRUE"
      @follow_up = params[:hidden_feedback]
      # chat_fragment = StudentChatFragment.create(response_type: "robot", chat_text: @follow_up,
      #                                            student_response: "i_knew_this")       
      @question = Concept.find_by_id(params[:concept_id].to_i).concept_prompt
    elsif params[:hidden_question].blank?
      @question = Concept.first.concept_prompt
    elsif params[:hidden_question]
      @question = params[:hidden_question]
    end

    if params[:dig_deeper] == "TRUE"
      @follow_up = params[:hidden_feedback]
      client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
      get_response = client.chat(
                              parameters: {
                                  model: "gpt-3.5-turbo", # Required.
                                  messages: [
                                    {"role": "system", "content": "I am are a sixth grade student you are tutoring in science."},
                                    {"role": "assistant", "content": "create a single question that would show a sixth-grade level knowledge about the following information: #{@follow_up}"},], # Required.
                                  temperature: 0.7,
                              })
      @question = get_response.dig("choices", 0, "message", "content")
      # chat_fragment = StudentChatFragment.create(response_type: "robot", chat_text: @follow_up, 
      #                                            student_response: "dig_deeper")       
    else
      if @question.blank?
        @question = Concept.first.concept_prompt
      end
    end 

    if params[:prompt].blank? 
      @response = ""
    else
      client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
      get_response = client.chat(
                              parameters: {
                                  model: "gpt-3.5-turbo", # Required.
                                  messages: [
                                    {"role": "system", "content": "I am are a sixth grade student you tutoring in science."},
                                    {"role": "assistant", "content": @question},
                                    { role: "user", content: @prompt},
                                    {"role": "assistant", "content": "explain anything missing from my answer"},], # Required.
                                  temperature: 0.7,
                              })
      @response = get_response.dig("choices", 0, "message", "content")
      # chat_fragment = StudentChatFragment.create(response_type: "robot", chat_text: @question,
      # student_response: nil)
      # chat_fragment = StudentChatFragment.create(response_type: "student", chat_text: @prompt,
      # student_response: nil)
    end
     
  end
    
  def subject_matter
  end
  
  def student_results
    @chat_history = StudentChatFragment.where(id: 144..152)
  end
  
  def chat_history
    @chat_history = StudentChatFragment.where(id: 144..152)
  end
  
end
