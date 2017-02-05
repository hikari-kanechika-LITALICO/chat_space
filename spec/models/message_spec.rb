require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid with all message" do
      expect(build(:message)).to be_valid
    end

    it "is invalid without a message" do
      message = build(:message, text: nil)
      message.valid?
      expect(message.errors[:text]).to include("を入力してください。")
    end
  end
end
