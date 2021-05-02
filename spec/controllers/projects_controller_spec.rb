require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end

  context "GET #new" do
    login_user
    it "returns a success response" do
      get :new
      expect(response).to be_success
    end
  end

  context "POST #projects" do
    login_user
    it "returns a success response" do
      post :create, :params => { :project => { :title => "Any Name" ,:body => "Any Name", :description => "Any Name" } }
      
      #expect(response).to be_success
      expect(Project.count).to eq(1)
    end
  end

  context "POST #projects" do
  login_user
  it "returns a bad response" do
    post :create, :params => { :project => { :title => "" ,:body => "Any Name", :description => "Any Name" } }
    
    #expect(response).to be_success
    expect(Project.count).to eq(0)
  end
end

  context "PATCH #projects/1" do
    login_user
    let!(:project) { Project.create(title: "Test title", body: "body", description: "Test") }
    it "returns a success response" do
      patch :update, :params => { :id => project, :project => { :title => "Test title", :body => "new bod", :description => "Test" }} #project: project, body: "new body"}
      expect(Project.first.body).to eq "new bod"
    end
  end

  context "PATCH #projects/1" do
  login_user
  let!(:project) { Project.create(title: "Test title", body: "body", description: "Test") }
  it "returns a failure response" do
    patch :update, :params => { :id => project, :project => { :title => "", :body => "new bod", :description => "Test" }} #project: project, body: "new body"}
    expect(Project.first.body).to eq "body"
  end
end


  

  context "DELETE #projects/1" do
    login_user
    let!(:project) { Project.create(title: "Test title", body: "body", description: "Test description") }
    it "Project was deleted" do
      expect(Project.count).to eq(1)
      delete :destroy, :params => { :id => project }
      expect(Project.count).to eq(0)
    end
    it "Project was deleted" do
    end
  end

end