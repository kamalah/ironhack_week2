require 'rspec'

class SomeClass

  def initialize(email_provider)
    @email_provider = email_provider
  end

  def check_subjects(words)
    subjects = @email_provider.get_subjects
    words.all? { |word| subjects.include?(word) }
  end
end

RSpec.describe "Stubs" do
  let (:some_stub) do
    instance_double("Calculator", "add" => 2)
  end
  let (:email_provider) do
    instance_double("EmailProvider",
                    "get_subjects" => ["hello", "goodbye", "Tell me more"] )
  end
  before do
    @some_class = SomeClass.new(email_provider)
  end
  it 'should work' do
    expect(some_stub.add("hello")).to eq(2)
  end

  describe SomeClass do
    it "shold return false when is not there" do
      expect(@some_class.check_subjects(["hello", "good afternoon"])).to be(false)
    end

    it "shold return true when is they are all there" do
      expect(@some_class.check_subjects(["hello", "goodbye"])).to be(true)
    end
  end
end
