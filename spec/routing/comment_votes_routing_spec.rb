require "spec_helper"

describe CommentVotesController do
  describe "routing" do

    it "routes to #index" do
      get("/comment_votes").should route_to("comment_votes#index")
    end

    it "routes to #new" do
      get("/comment_votes/new").should route_to("comment_votes#new")
    end

    it "routes to #show" do
      get("/comment_votes/1").should route_to("comment_votes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/comment_votes/1/edit").should route_to("comment_votes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/comment_votes").should route_to("comment_votes#create")
    end

    it "routes to #update" do
      put("/comment_votes/1").should route_to("comment_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/comment_votes/1").should route_to("comment_votes#destroy", :id => "1")
    end

  end
end
