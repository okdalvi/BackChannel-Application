require 'spec_helper'

describe "comment_votes/show" do
  before(:each) do
    @comment_vote = assign(:comment_vote, stub_model(CommentVote,
      :user_id => 1,
      :comment_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
