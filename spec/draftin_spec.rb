require 'spec_helper'

describe Draftin do
  
  describe ".respond_to?" do
    it "is true if method exists" do
      expect(Draftin.respond_to?(:new, true)).to eq(true)
    end
  end
  
  describe ".new" do
    it "is a Draftin::Client" do
      expect(Draftin.new).to be_a Draftin::Client
    end
  end
end