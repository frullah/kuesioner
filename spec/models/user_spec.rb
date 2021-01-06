require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    context "associations" do
      it { is_expected.to belong_to(:authenticatable) }
    end

    context "uniqueness" do
      subject { FactoryBot.create(:user, :admin) }
      it { is_expected.to validate_uniqueness_of(:username) }
    end
    
    context "presences" do
      it { is_expected.to validate_presence_of(:username) }

      it { is_expected.not_to validate_presence_of(:email) }
    end
  end
  
end
