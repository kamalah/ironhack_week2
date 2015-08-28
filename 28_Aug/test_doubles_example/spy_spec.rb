require 'rspec'

RSpec.describe "Spy" do
  it 'should work' do
    calculator = spy("calculator")
    calculator.add("1,2")
    expect(calculator).to have_received(:add).with("1,2")
  end
end
