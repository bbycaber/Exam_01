require 'spec_helper'

describe Post do


  before :all do

    user = User.new("Luis")
    post = Post.new("The best","Im the best for long time", "2014-06-05",user)

    File.open "post.yml", 'w' do |f|
    f.write YAML::dump post
    end
  end



  describe "#initialize" do

    context "with a yaml file" do
      it "should properly load a post from a yaml file" do
        post = Post.new("post.yml")
        expect(post).to be_kind_of(Post)
      end

      it "should correct title" do
        post = Post.new("post.yml")
        expect(post.title).to eql("The best")
      end

      it "should correct text" do
        post = Post.new("post.yml")
        expect(post.text).to eql("Im the best for long time")
      end

      it "should correct date" do
        post = Post.new("post.yml")
        expect(post.date).to eql("2014-06-05")
      end

    end

    context "with proper attributes" do
      it "should properly initialize a post instance" do
        user = User.new("Luis")
        post = Post.new("The best","Im the best for long time", "2014-06-05",user)
        expect(post).to be_kind_of(Post)
      end
    end

  end
  describe "#summary" do
    it "should display the first 10 words of text"
  end

  describe "#tagme" do
    it "should be able to tag with 1 tag"
    it "should be able to tag with 4 tags"
  end

  describe "#same?" do
    it "should return true if Title, Date and Text are the same"do
        user = User.new("Luis")
        post = Post.new("The best","Im the best for long time", "2014-06-05",user)
        expect(post.same?("The best","Im the best for long time", "2014-06-05")).to be_true

    end
    it "should return false if Title, Date and Text are not the same"do
        user = User.new("Luis")
        post = Post.new("The best","Im the best for long time", "2014-06-05",user)
        expect(post.same?("The WORST","Im the WORST for long time", "2014-06-05")).to be_false

    end
  end

  describe "#display_entry" do
    it "should properly output a post entry"
  end

  describe "#save" do
    it "should save the post to a YAML file"
  end

end
