require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :title => "MyString",
      :body => "MyText",
      :description => "MyText",
      :slug => "MyString"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input[name=?]", "project[title]"

      assert_select "textarea[name=?]", "project[body]"

      assert_select "textarea[name=?]", "project[description]"

      assert_select "input[name=?]", "project[slug]"
    end
  end
end
