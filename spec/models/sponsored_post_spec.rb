require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:name) { RandomData.random_sentence }
	let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_question }
  let(:body) { RandomData.random_paragraph }
  let(:price) { RandomData.random_price }
  
  let(:topic) { Topic.create!(name: name, description: description) }
  let(:sponsoredposts) { topic.sponsored_posts.create!(title: title, body: body, price: price) }
  
  
  describe "attributes" do
    it "has title, body attributes" do
      expect(sponsoredposts).to have_attributes(title: title, body: body)
    end

  end


end
