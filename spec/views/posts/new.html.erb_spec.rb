require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :name => "MyString",
      :content => "MyString",
      :comments_count => 1,
      :tag => "MyString"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input#post_name[name=?]", "post[name]"
      assert_select "input#post_content[name=?]", "post[content]"
      assert_select "input#post_comments_count[name=?]", "post[comments_count]"
      assert_select "input#post_tag[name=?]", "post[tag]"
    end
  end
end
