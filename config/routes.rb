Rails.application.routes.draw do
  resources :student_chat_fragments
  resources :concepts
  resources :subject_matters
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/subject_matter', to: "chat#subject_matter"
  get '/student_results', to: "chat#student_results"
  get '/chat_history', to: "chat#chat_history"
  get '/better_understand', to: 'chat#better_understand'
  # Defines the root path route ("/")
  root "chat#index"
end
