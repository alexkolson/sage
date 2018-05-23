require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Translate' do
    it 'should properly translate the knowledgebase question and answer into german' do
      @article = Article.new({ question: 'How much wood would a woodchuck chuck if a woodchuck could chuck wood?', answer: 'A woodchuck would chuck as much wood as a woodchuck could if a woodchuck could chuck wood' })
      @article.translate
      expect(@article.translated_question).to be_truthy
      expect(@article.translated_answer).to be_truthy
    end
  end
end
