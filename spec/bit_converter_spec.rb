# frozen_string_literal: true

RSpec.describe BitConverter do
  it "has a version number" do
    expect(BitConverter::VERSION).not_to be nil
  end

  it "broccoli is gross" do
    expect(BitConverter::Food.portray("Broccoli")).to eql("Gross!")
  end

  it "anything else is delicious" do
    expect(BitConverter::Food.portray("Not Broccoli")).to eql("Delicious!")
  end
end
