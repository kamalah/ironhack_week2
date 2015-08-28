require "rspec"

require_relative "comment.rb"

RSpec.describe Comment do 

	before :each do 
		@comment_normal = Comment.new("xavi", "ironhack", false)
		@comment_normal.check_for_spam
		@comment_spam =Comment.new("rafa", "http://www.google.com http://www.ironhack.com", false)
		@comment_spam.check_for_spam
	end
		
	describe "comment class" do 
		it "should initiate a new comment with three attributes: 1. the author's name 2. the comment's content 3. whether it is spam or not" do
			expect(@comment_normal.show_comment).to eq("xavi ironhack false")
		end

		it "should verify if the comment string contains two URLs (indicated by http://) -> if yes, mark attribute spamornot as true" do
			expect(@comment_spam.spamornot).to eq (true)
		end

		it "should not change the spamornot attribute if there are less than 2 URLs" do 
			expect(@comment_normal.spamornot).to eq(false)
		end
	end
end
