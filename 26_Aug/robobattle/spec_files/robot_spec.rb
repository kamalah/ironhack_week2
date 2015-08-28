require "rspec"
require_relative "../ruby_files/robot.rb"


RSpec.describe RoboContender do 
  before :each do
  	@robo = RoboContender.new
  end

  it "has initial strength 100" do
  	expect(@robo.strength).to eq(100)
  end

end