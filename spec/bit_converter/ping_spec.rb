# frozen_string_literal: true

RSpec.describe BitConverter::Ping do
  it "broccoli is gross" do
    expect(described_class.ping).to eql("pong!")
  end
end
