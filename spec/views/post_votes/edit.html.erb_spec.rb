require 'spec_helper'

describe "post_votes/edit" do
  before(:each) do
    @post_vote = assign(:post_vote, stub_model(PostVote,
      :post => nil,
      :user => nil
    ))
  end

  it "renders the edit post_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_vote_path(@post_vote), "post" do
      assert_select "input#post_vote_post[name=?]", "post_vote[post]"
      assert_select "input#post_vote_user[name=?]", "post_vote[user]"
    end
  end
end
