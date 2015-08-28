require 'rspec'

RSpec.describe "Mocks" do
  it 'should work' do
    calculator = double("calculator")
    expect(calculator).to receive(:add) { 2 }
    expect(calculator.add).to eq(2)
  end
end
