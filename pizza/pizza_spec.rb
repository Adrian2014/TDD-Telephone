require 'rspec'
require_relative 'pizza'

RSpec.describe Pizza do
  before do
    @pizza = Pizza.create("Pepperoni")
  end

  describe "#initialize" do
    it "creates a pizza object" do
      expect(@pizza).to be_a Pizza
    end
    it "should return proper name" do
      expect(@pizza.name).to eq("Pepperoni")
    end
    it "should return proper description" do
      expect(@pizza.description).not_to be_nil
    end
    it "should return proper time_baked" do
      expect(@pizza.time_baked).to eq(0)
    end

  end
end
