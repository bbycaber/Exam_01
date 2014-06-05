require 'spec_helper'

describe User do



  before :each do
    @user = User.new("Luis")
  end

  describe "#initialize" do
    it "should properly initialize with an username" do
      expect(@user).to be_kind_of(User)
    end

    it "should correct name" do
      expect(@user.name).to eql("Luis")
    end

  end

  describe "respond to method" do
    it "should respond to #name" do
            expect(@user).to respond_to(:add_post)
    end

    it "should respond to #name" do
            expect(@user).to respond_to(:list)
    end

    it "should respond to #name" do
            expect(@user).to respond_to(:find_post_by_title)
    end
   end

  describe "#add_post" do
    it "should add a post to the posts list"
  end

  describe "#list" do
    it "should properly ouput all posts"
  end

  describe "#find_post_by_title" do
    it "should return a post by title"
    it "should return the first one if there are several with the same name"
  end

end
