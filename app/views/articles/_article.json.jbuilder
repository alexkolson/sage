json.extract! article, :id, :question, :answer, :created_at, :updated_at
json.url article_url(article, format: :json)
