require "rspec"

require_relative "comment_list.rb"
require_relative "comment.rb"

RSpec.describe CommentList do 
	before :each do 
		@comment_list = CommentList.new
		@comment_normal = Comment.new("xavi", "ironhack", false)
		@comment_normal.check_for_spam
		@comment_spam =Comment.new("rafa", "http://www.google.com http://www.ironhack.com", false)
		@comment_spam.check_for_spam
	end

	describe "comment_list class" do 

		it "should initiate an empty array and output each added item through a method" do
			expect(@comment_list.show_array).to eq("")
		end

		it "should add strings to the array and output each them in a new line each" do
			expect(@comment_list.add_comment_string("comment1")).to eq("comment1")
		end

		it "should add instances of the Comment class to the array instead of mere strings" do
			expect(@comment_list.add_comment_object(@comment_normal)).to be_a Comment
		end

		it "should output only the comments whose 'spamornot' attribute is 'false' in a separate method" do
			expect(@comment_list.add_spam_comment(@comment_spam)).to eq("")
		end
	end
end

