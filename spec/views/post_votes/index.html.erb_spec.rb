require 'spec_helper'

describe "post_votes/index" do
  before(:each) do
    assign(:post_votes, [
      stub_model(PostVote,
        :post => nil,
        :user => nil
      ),
      stub_model(PostVote,
        :post => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of post_votes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
