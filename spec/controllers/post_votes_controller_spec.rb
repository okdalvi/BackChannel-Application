require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PostVotesController do

  # This should return the minimal set of attributes required to create a valid
  # PostVote. As you add validations to PostVote, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "post" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostVotesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all post_votes as @post_votes" do
      post_vote = PostVote.create! valid_attributes
      get :index, {}, valid_session
      assigns(:post_votes).should eq([post_vote])
    end
  end

  describe "GET show" do
    it "assigns the requested post_vote as @post_vote" do
      post_vote = PostVote.create! valid_attributes
      get :show, {:id => post_vote.to_param}, valid_session
      assigns(:post_vote).should eq(post_vote)
    end
  end

  describe "GET new" do
    it "assigns a new post_vote as @post_vote" do
      get :new, {}, valid_session
      assigns(:post_vote).should be_a_new(PostVote)
    end
  end

  describe "GET edit" do
    it "assigns the requested post_vote as @post_vote" do
      post_vote = PostVote.create! valid_attributes
      get :edit, {:id => post_vote.to_param}, valid_session
      assigns(:post_vote).should eq(post_vote)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PostVote" do
        expect {
          post :create, {:post_vote => valid_attributes}, valid_session
        }.to change(PostVote, :count).by(1)
      end

      it "assigns a newly created post_vote as @post_vote" do
        post :create, {:post_vote => valid_attributes}, valid_session
        assigns(:post_vote).should be_a(PostVote)
        assigns(:post_vote).should be_persisted
      end

      it "redirects to the created post_vote" do
        post :create, {:post_vote => valid_attributes}, valid_session
        response.should redirect_to(PostVote.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post_vote as @post_vote" do
        # Trigger the behavior that occurs when invalid params are submitted
        PostVote.any_instance.stub(:save).and_return(false)
        post :create, {:post_vote => { "post" => "invalid value" }}, valid_session
        assigns(:post_vote).should be_a_new(PostVote)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PostVote.any_instance.stub(:save).and_return(false)
        post :create, {:post_vote => { "post" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post_vote" do
        post_vote = PostVote.create! valid_attributes
        # Assuming there are no other post_votes in the database, this
        # specifies that the PostVote created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PostVote.any_instance.should_receive(:update_attributes).with({ "post" => "" })
        put :update, {:id => post_vote.to_param, :post_vote => { "post" => "" }}, valid_session
      end

      it "assigns the requested post_vote as @post_vote" do
        post_vote = PostVote.create! valid_attributes
        put :update, {:id => post_vote.to_param, :post_vote => valid_attributes}, valid_session
        assigns(:post_vote).should eq(post_vote)
      end

      it "redirects to the post_vote" do
        post_vote = PostVote.create! valid_attributes
        put :update, {:id => post_vote.to_param, :post_vote => valid_attributes}, valid_session
        response.should redirect_to(post_vote)
      end
    end

    describe "with invalid params" do
      it "assigns the post_vote as @post_vote" do
        post_vote = PostVote.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PostVote.any_instance.stub(:save).and_return(false)
        put :update, {:id => post_vote.to_param, :post_vote => { "post" => "invalid value" }}, valid_session
        assigns(:post_vote).should eq(post_vote)
      end

      it "re-renders the 'edit' template" do
        post_vote = PostVote.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PostVote.any_instance.stub(:save).and_return(false)
        put :update, {:id => post_vote.to_param, :post_vote => { "post" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post_vote" do
      post_vote = PostVote.create! valid_attributes
      expect {
        delete :destroy, {:id => post_vote.to_param}, valid_session
      }.to change(PostVote, :count).by(-1)
    end

    it "redirects to the post_votes list" do
      post_vote = PostVote.create! valid_attributes
      delete :destroy, {:id => post_vote.to_param}, valid_session
      response.should redirect_to(post_votes_url)
    end
  end

end
