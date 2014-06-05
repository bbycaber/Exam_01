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
    it "should respond to #add_post" do
            expect(@user).to respond_to(:add_post)
    end

    it "should respond to #add_post" do
            expect(@user).to respond_to(:list)
    end

    it "should respond to #find_post_by_title" do
            expect(@user).to respond_to(:find_post_by_title)
    end
   end

  describe "#add_post" do
    it "should add a post to the posts list" do
      @user.add_post("A","ABCD","2014-06-05")
      expect(@user.posts.size).to eql(1)
    end

  end

  describe "#all_posts" do
    it "should add a post to the posts list" do
      @user.add_post("A","ABCD","2014-06-05")
      @user.add_post("B","ABCD","2014-06-05")
      @user.add_post("C","ABCD","2014-06-05")
      expect(@user.all_posts[0].title).to eql("C")
    end
  end
  

  describe "#list" do
    it "should properly ouput all posts" do
      @user.add_post("A","123","2014-06-05")
      @user.add_post("B","456","2014-06-05")
      @user.add_post("C","789","2014-06-05")
      expect(@user.list[0]).to eql("Luis,2014-06-05\nA\n123\ntags:")
      expect(@user.list[1]).to eql("Luis,2014-06-05\nB\n456\ntags:")
      expect(@user.list[2]).to eql("Luis,2014-06-05\nC\n789\ntags:")
    end
  end

  describe "#find_post_by_title" do
    it "should return a post by title" do
      @user.add_post("A","123","2014-06-05")
      expect(@user.find_post_by_title("A").text).to eql("123")
    end
    it "should return the first one if there are several with the same name" do
       @user.add_post("A","456","2014-06-05")
       @user.add_post("A","789","2014-06-05")
       @user.add_post("A","123","2014-06-05")
       expect(@user.find_post_by_title("A").text).to eql("456")

    end
  end

  describe "#tag_cloud" do
    it "corret value" do
      @user.add_post("A","456","2014-06-05")
      @user.add_post("A","789","2014-06-05")
      @user.add_post("A","123","2014-06-05")
      @user.posts[0].tagme(:electronics,:sports,:school,:Intec,:electronics,:electronics,:electronics)
      @user.posts[1].tagme(:electronics,:sports,:school,:ruby,:electronics,:electronics)
      @user.posts[2].tagme(:electronics,:sports,:school,:Intec,:Intec,:Intec,:Intec,:ruby)
      expect(@user.tag_cloud[:electronics]).to eql(8)

      
    end
  end

end
