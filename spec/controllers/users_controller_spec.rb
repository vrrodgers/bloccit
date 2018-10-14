require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:new_user_attributes) do
        {
            name: "Blochead",
            email: "blochead@bloc.io",
            password: "blochead",
            password_confirmation: "blochead"
        }
    end
    describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end
 
     it "instantiates a new user" do
       get :new
       expect(assigns(:user)).to_not be_nil
     end
    end
    describe "POST create" do
      it "returns an http redirect" do
        post :create, params: { user: new_user_attributes }
        expect(response).to have_http_status(:redirect)
       end
        it "creates a new user" do
          expect{
             post :create, params: { user: new_user_attributes }
            }.to change(User, :count).by(1)
        end
        it "sets user name properly" do
          post :create, params: { user: new_user_attributes }
        expect(assigns(:user).name).to eq new_user_attributes[:name]
        end
        it "sets user email properly" do
          post :create, params: { user: new_user_attributes }
          expect(assigns(:user).email).to eq new_user_attributes[:email]
        end
        it "sets user password properly" do
          post :create, params: { user: new_user_attributes }
          expect(assigns(:user).password).to eq new_user_attributes[:password]
        end
        it "sets user password_confirmation properly" do
          post :create, params: { user: new_user_attributes }
          expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
        end
        it "logs the user in after sign up" do
         post :create, params: { user: new_user_attributes }
         expect(session[:user_id]).to eq assigns(:user).id
        end
      end


    describe "not signed in" do
     let(:factory_user) { create(:user) }
 
     before do
       post :create, params: { user: new_user_attributes }
     end
 
 
     it "returns http success" do
       get :show, params: { id: factory_user.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #show view" do
       get :show, params: { id: factory_user.id }
       expect(response).to render_template :show
     end
 
     it "assigns factory_user to @user" do
       get :show, params: { id: factory_user.id }
       expect(assigns(:user)).to eq(factory_user)
     end
   end

    describe "#favorite_for(post)" do
      before do
        topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
        @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
      end

      it "returns `nil` if the user has not favorited the post" do
        expect(user.favorite_for(@post)).to be_nil
      end

      it "returns the appropriate favorite if it exists" do
        favorite = user.favorites.where(post: @post).create
        expect(user.favorite_for(@post)).to eq(favorite)
      end
    end
    describe ".avatar_url" do
      let(:known_user) { create(:user, email: "blochead@bloc.io") }

      it "returns the proper Gravatar url for a known email entity" do
        expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
        expect(known_user.avatar_url(48)).to eq(expected_gravatar)
      end
    end
end
