json.extract! question, :id, :subgenre_id, :description, :choice1, :choice2, :choice3, :choice4, :correct1, :correct2, :correct3, :correct4, :created_at, :updated_at
json.url question_url(question, format: :json)
