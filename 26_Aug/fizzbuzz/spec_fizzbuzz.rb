require 'rspec'
require_relative 'fizzbuzz.rb'

RSpec.describe FizzBuzz do 
  	before :all do
		@fizzbuzz = FizzBuzz.new
	end

   	it "Returns fizz for multiple of 3" do
      expect(@fizzbuzz.check(3)).to eq("Fizz")
    end
  
  	it "Returns buzz for multiple of 5" do
      expect(@fizzbuzz.check(10)).to eq("Buzz")
    end

    it "Returns fizzbuzz for multiple of 15" do
      expect(@fizzbuzz.check(30)).to eq("FizzBuzz")
    end

    it "Returns number in all other cases" do
    	expect(@fizzbuzz.check(2)).to eq(2)
    end
  
end