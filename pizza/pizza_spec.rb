require 'rspec'
require_relative 'pizza'

RSpec.describe Pizza do
  before do
    @pizza = Pizza.new("Pepperoni")
    @pizza.toppings << Topping.new(name:"Salami",required_bake_time:40)
    @pizza.toppings << Topping.new(name:"Olives",required_bake_time:20)
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
    it "should have many toppings" do
      expect(@pizza.toppings).to be_a Array
    end

  end
  describe "#required_bake_time" do
    it "Checks for required bake time" do
      expect(@pizza.required_bake_time).to eq (900+40)
    end
  end

  describe "#bake" do
    it "should increment time_baked of the pizza by the argument time" do
      @pizza.bake(40)
      expect(@pizza.time_baked).to eq (40)
    end
    it "should increment time_baked of the toppings by the argument time" do
      @pizza.bake(40)
      expect(@pizza.toppings[0].time_baked).to eq(40)
    end

  end
  describe "#baked?" do
    it "should return false if pizza hasnt finished baking" do
      expect(@pizza.baked?).to be false
    end
    it "should return true if pizza is baked" do
      @pizza.bake(940)
      expect(@pizza.baked?).to be true
    end

  end

  describe "#unfinished_toppings" do
    it "should return an array of its toppings that have finished baking" do
      expect(@pizza.unfinished_toppings.length).to eq(2)
    end
    it "should return an array of its toppings that have finished baking" do
      @pizza.bake(45)
      expect(@pizza.unfinished_toppings.length).to eq(0)
    end
  end
  describe "#finished_toppings" do
    it "should return an array of its toppings that have finished baking" do
      expect(@pizza.finished_toppings.length).to eq(0)
    end
    it "should return an array of its toppings that have finished baking" do
      @pizza.bake(45)
      expect(@pizza.finished_toppings.length).to eq(2)
    end
  end
end

RSpec.describe Topping do
  before do
    @topping = Topping.new(name:"Salami",required_bake_time:40)
  end

  describe "#initialize" do
    it "creates a topping object" do
      expect(@topping).to be_a Topping
    end
    it "should return proper required_bake_time" do
      expect(@topping.required_bake_time).to eq(40)
    end
    it "should return proper time_baked" do
      expect(@topping.time_baked).to eq(0)
    end
  end
  describe "#bake" do
    it "should increment time_baked by the argument time" do
      @topping.bake(4)
      expect(@topping.time_baked).to eq (4)
    end
  end
  describe "#baked?" do
    it "baked? should be equal to false before 41 minutes" do
      @topping.bake(11)
      expect(@topping.baked?).to eq (false)
    end
    it "baked? should be equal to true after 41 minutes" do
      @topping.bake(41)
      expect(@topping.baked?).to eq (true)
    end
  end
end
