require 'spec_helper'

describe "post_votes/show" do
  before(:each) do
    @post_vote = assign(:post_vote, stub_model(PostVote,
      :post => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
