require 'spec_helper'

describe "comment_votes/new" do
  before(:each) do
    assign(:comment_vote, stub_model(CommentVote,
      :user_id => 1,
      :comment_id => 1
    ).as_new_record)
  end

  it "renders new comment_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_votes_path, "post" do
      assert_select "input#comment_vote_user_id[name=?]", "comment_vote[user_id]"
      assert_select "input#comment_vote_comment_id[name=?]", "comment_vote[comment_id]"
    end
  end
end
