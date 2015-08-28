require_relative "./string_calc.rb"
require "rspec"


RSpec.describe StringCalc do
	before :all do
		@calculator = StringCalc.new
	end

	describe "#add method" do
		it "should return 0 when adding empty" do
			expect(@calculator.add("")).to eq(0)	
		end

		it "should return the number when adding string with 1 number" do
			expect(@calculator.add("1")).to eq(1)	
		end

		it "should add two numbers together" do
			expect(@calculator.add("1,4")).to eq(5)	
		end

		it "should add three numbers together" do
			expect(@calculator.add("1,4,5")).to eq(10)	
		end

		it "check endl instead of ," do
			expect(@calculator.add("1\n4\n5")).to eq(10)	
		end
	end

	describe "#multiply method" do
		it "should return 0 when multiply empty" do
			expect(@calculator.multiply("")).to eq(0)	
		end

		it "should return the number when multiplying string with 1 number" do
			expect(@calculator.multiply("4")).to eq(4)	
		end

		it "should multiply two numbers together" do
			expect(@calculator.multiply("1,4")).to eq(4)	
		end

		it "should multiply three numbers together" do
			expect(@calculator.multiply("1,4,5")).to eq(20)	
		end

		it "should multiply skip zeros test 1" do
			expect(@calculator.multiply("1,0,4,0,5")).to eq(20)	
		end
		it "should multiply skip zeros test 6" do
			expect(@calculator.multiply("1,2,3,0")).to eq(6)	
		end
	end

	describe "#power method" do
		it "should do a power" do
			expect(@calculator.power("2,3")).to eq(8)
		end

		it "should do a power with three number" do
			expect(@calculator.power("2,3,3")).to eq(512)
		end

		it "should do a power with four number" do
			expect(@calculator.power("2,1,3,2")).to eq(64)
		end
	end
end