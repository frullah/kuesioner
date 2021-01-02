require "rails_helper"

RSpec.describe Admin, type: :model do
  describe "validations" do
    context "associations" do
      it { is_expected.to have_one(:user) }
    end
  end
end
