require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:dessert) {Dessert.new("pie", 50, "leBeauf")}
  let(:chef) { double("chef") }


  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("pie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("pie","a billion", "leBeauf")}.to raise_error ArgumentError
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("whipped cream")
      expect(dessert.ingredients).to include("whipped cream")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.ingredients = [:blueberries, :crust, :whipped_cream, :jelly]
      dessert.mix!
      expect(dessert.ingredients).not_to eq([:blueberries, :crust, :whipped_cream, :jelly])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(3)
      expect(dessert.quantity).to eq(47)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(56)}.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).with("leBeauf")
      expect(dessert.serve).to eq("Le Beauf has made 50 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(dessert.chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
