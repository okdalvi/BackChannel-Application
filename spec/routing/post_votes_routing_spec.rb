require "spec_helper"

describe PostVotesController do
  describe "routing" do

    it "routes to #index" do
      get("/post_votes").should route_to("post_votes#index")
    end

    it "routes to #new" do
      get("/post_votes/new").should route_to("post_votes#new")
    end

    it "routes to #show" do
      get("/post_votes/1").should route_to("post_votes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/post_votes/1/edit").should route_to("post_votes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/post_votes").should route_to("post_votes#create")
    end

    it "routes to #update" do
      put("/post_votes/1").should route_to("post_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/post_votes/1").should route_to("post_votes#destroy", :id => "1")
    end

  end
end
