class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :subgenre, foreign_key: true

      t.timestamps
    end
  end
end
