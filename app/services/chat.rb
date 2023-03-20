class Chat
  def initialize(api_key)
    @api_key = api_key
    @client = OpenAI::Client.new(api_key: api_key)
  end

  def generate_response(prompt)
    response = @client.completions(
      engine: 'text-davinci-003',
      prompt: prompt,
      max_tokens: 1500,
      n: 1,
      stop: '\n',
      temperature: 0.5
    )

    response.choices.first.text.strip
  end
end

