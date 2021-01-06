require "rails_helper"

RSpec.describe MataKuliah, type: :model do
  describe "validations" do
    context "presences" do
      it { is_expected.to validate_presence_of(:nama) }
    end

    context "uniqueness" do
      it { is_expected.to validate_uniqueness_of(:nama) }
    end

    context "numbericality" do
      it {
        is_expected.to validate_numericality_of(:sks)
          .only_integer
          .is_greater_than(0)
          .is_less_than(10)
      }

      it {
        is_expected.to validate_numericality_of(:semester)
          .only_integer
          .is_greater_than(0)
          .is_less_than(14)
      }
    end
  end
end
