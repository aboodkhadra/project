require 'rails_helper'

describe User, type: :model do
  context "testing validations" do

    it "should not validate users without an email address" do
      @user = FactoryBot.build(:user, email: "not_an_email")
      expect(@user).to_not be_valid
    end
  end
end
