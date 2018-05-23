class AddTranslateColumnsToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :translated_question, :string
    add_column :articles, :translated_answer, :string
  end
end
