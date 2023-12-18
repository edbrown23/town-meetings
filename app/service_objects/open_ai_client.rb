class OpenAiClient
  def generate_summary(meeting_text)
    raw_client.post('v1/chat/completions') do |req|
      req.body = generate_summary_prompt(meeting_text).to_json
    end
  end

  private

  def generate_summary_prompt(meeting_text)
    {
      model: 'gpt-4',
      messages: [
        {
          "role": "system",
          "content": "You are a summarizer of local town meetings, based on transcripts of those meetings. When sent a transcript, you provide the summary, highlighting the key points. The participants are local elected officials and residents of the town. Err on the side of providing more detail, not less, including quotes from the transcript"
        },
        {
          "role": "user",
          "content": meeting_text
        }
      ]
    }
  end

  def raw_client
    @conn ||= Faraday.new(
      url: 'https://api.openai.com',
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{Rails.configuration.x.openai_api_key}"
      }
    ) do |f|
      f.response(:json)
    end
  end
end