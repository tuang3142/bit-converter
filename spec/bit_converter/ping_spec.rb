# frozen_string_literal: true

RSpec.describe BitConverter::Food do
  it "broccoli is gross" do
    expect(described_class.portray("Broccoli")).to eql("Gross!")
  end

  it "anything else is delicious" do
    expect(described_class.portray("Not Broccoli")).to eql("Delicious!")
  end

  it "pluralizes a word" do
    expect(described_class.pluralize("Tomato")).to eql("Tomatoes")
  end
end
