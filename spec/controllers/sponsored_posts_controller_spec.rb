require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
 let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
 let(:my_sponsoredpost) { my_topic.sponsored_posts.create!(title: RandomData.random_question, body: RandomData.random_paragraph, price: RandomData.random_price) }
    
  
  describe "GET #show" do
    it "returns http success" do
      get :show, params: {topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to render_template :show
    end
    
    it "assigns my_sponsoredpost to @sponsoredpost" do
      get :show, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(assigns(:sponsoredpost)).to eq(my_sponsoredpost)
    end
  end

  describe "GET #new" do
    it "returns http success" do
     get :new, params: { topic_id: my_topic.id }
      expect(response).to have_http_status(:success)
    end
  
    it "renders the #new view" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { topic_id: my_topic.id, id: my_sponsoredpost.id }
      expect(response).to have_http_status(:success)
    end
  end
end
