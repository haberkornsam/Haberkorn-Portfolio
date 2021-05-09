require 'rails_helper'

RSpec.describe "projects/index", type: :view do

  before(:each) do
    assign(:projects, [
      Project.create!(
        :title => "Title",
        :body => "MyText",
        :description => "MyTexts"
      ),
      Project.create!(
        :title => "Title1",
        :body => "MyText1",
        :description => "MyTexts1"
      )
    ])
  end

  it "renders a list of projects" do
    render
    expect(rendered).to have_text("Title")
    expect(rendered).to have_text("Title1")
    expect(rendered).to have_text("MyTexts")
    expect(rendered).to have_text("MyTexts1")
  end
end
