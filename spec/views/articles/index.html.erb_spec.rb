require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :question => "Question",
        :answer => "Answer"
      ),
      Article.create!(
        :question => "Question",
        :answer => "Answer"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
  end
end
