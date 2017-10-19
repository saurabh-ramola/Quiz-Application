json.extract! quiz, :id, :name, :subgenre_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
