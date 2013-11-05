require 'spec_helper'

describe "post_votes/new" do
  before(:each) do
    assign(:post_vote, stub_model(PostVote,
      :post => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new post_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_votes_path, "post" do
      assert_select "input#post_vote_post[name=?]", "post_vote[post]"
      assert_select "input#post_vote_user[name=?]", "post_vote[user]"
    end
  end
end
