class Article < ApplicationRecord
  before_save  :translate

  def translate
    key = ENV['MS_TRANSLATE_KEY']

    host = ENV['MS_TRANSLATE_HOST']
    path = '/translate?api-version=3.0'
    
    # Translate to German and Italian.
    params = '&to=de'
    
    uri = URI(host + path + params)
    
    content = '[{"Text" : "' + self.question.to_s + '"},{"Text" : "' + self.answer.to_s + '"}]'
    
    request = Net::HTTP::Post.new(uri)
    request['Content-type'] = 'application/json'
    request['Content-length'] = content.length
    request['Ocp-Apim-Subscription-Key'] = key
    request['X-ClientTraceId'] = SecureRandom.uuid
    request.body = content
    
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request (request)
    end
    
    result = response.body.force_encoding("utf-8")

    translatedGoodieBag = JSON.parse(result)

    json = JSON.pretty_generate(translatedGoodieBag)
    puts json 

    self.translated_question = translatedGoodieBag[0]['translations'][0]['text']
    self.translated_answer = translatedGoodieBag[1]['translations'][0]['text']
  end
end
