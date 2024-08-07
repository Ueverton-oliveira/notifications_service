require 'rails_helper'

RSpec.describe Notification, type: :model do
  it "has a valid factory" do
    expect(build(:notification)).to be_valid
  end

  describe "validations" do
    it "is invalid without a message" do
      notification = build(:notification, message: nil)
      expect(notification).to_not be_valid
      expect(notification.errors[:message]).to include("can't be blank")
    end

    it "is invalid without a received_at" do
      notification = build(:notification, received_at: nil)
      expect(notification).to_not be_valid
      expect(notification.errors[:received_at]).to include("can't be blank")
    end

    it "is invalid without task_details" do
      notification = build(:notification, task_details: nil)
      expect(notification).to_not be_valid
      expect(notification.errors[:task_details]).to include("can't be blank")
    end

    it "is invalid without user_data" do
      notification = build(:notification, user_data: nil)
      expect(notification).to_not be_valid
      expect(notification.errors[:user_data]).to include("can't be blank")
    end
  end
end
