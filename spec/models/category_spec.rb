require 'spec_helper'

describe Category do
  before :each do
    @category = Category.new(:title => "A Category")
  end

  it 'should be created' do

    @category.should_not be_nil
  end

  it 'should have a name' do

    @category.title.should_not be_nil
  end

  #it 'should have id' do

  #    @category.id.should_not be_nil
  # end
end