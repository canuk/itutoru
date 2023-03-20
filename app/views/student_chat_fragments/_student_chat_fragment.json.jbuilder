json.extract! student_chat_fragment, :id, :student_chat_id, :response_type, :chat_text, :student_response, :created_at, :updated_at
json.url student_chat_fragment_url(student_chat_fragment, format: :json)
