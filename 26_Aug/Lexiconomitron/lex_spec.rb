require_relative "./lexrex.rb"
require "rspec"

RSpec.describe Lexiconomitron do 
  before :each do
  	@lexi = Lexiconomitron.new
  end

  describe "#eat_t" do
    it "removes every letter t from the input" do
        expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
   	ans =  ["sih", "se"]
   	it "test shazam function" do
   		expect(@lexi.shazam("This is a boring test")).to eq(ans)
   	end
   end

   describe "#oompa loompa" do 
   	it "check oompa loompa" do
   		expect(@lexi.oompa_loompa("if you wanna be my lover")).to eq(["if","you","be","my"])
   	end

	it "check oompa loompa with ts" do
   		expect(@lexi.oompa_loompa("you got to get with my friends")).to eq(["you","go","o","ge", "my"])
   	end   	
   end
end