require 'spec_helper'

describe "comment_votes/edit" do
  before(:each) do
    @comment_vote = assign(:comment_vote, stub_model(CommentVote,
      :user_id => 1,
      :comment_id => 1
    ))
  end

  it "renders the edit comment_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_vote_path(@comment_vote), "post" do
      assert_select "input#comment_vote_user_id[name=?]", "comment_vote[user_id]"
      assert_select "input#comment_vote_comment_id[name=?]", "comment_vote[comment_id]"
    end
  end
end
