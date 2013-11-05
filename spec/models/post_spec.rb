require 'spec_helper'

describe Post do

  before do
    # This code is not idiomatically correct.
    @post = Post.new(content: "Sample Post", comments_count: 99, category_id: "", tag: "" )    #see how user_id shud be passed
  end


  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:comments_count) }
  it { should respond_to(:category_id) }
  it { should respond_to(:tag) }



  describe "too much content" do
    before { @post.content = "xxx" * 999 }
    it { should_not be_valid }
  end



  describe "when user_id is absent" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "null content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end



end
