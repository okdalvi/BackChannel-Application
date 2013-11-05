require 'spec_helper'

describe User do

    before do
    @user = User.new(name: "trial_use", email: "trial_user@something.com",password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should be_valid }


    describe "when username is absent" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is absent" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is absent" do
    before {@user.password=" "}
    it { should_not be_valid }
  end














end
