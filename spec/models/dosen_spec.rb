require "rails_helper"

RSpec.describe Dosen, type: :model do
  describe "validations" do
    context "presences" do
      it { is_expected.to validate_presence_of(:nama) }
      it { is_expected.to validate_presence_of(:nidn) }
    end

    context "length" do
      it { is_expected.to validate_length_of(:nama).is_at_most(48) }
      it { is_expected.to validate_length_of(:nidn).is_at_most(14) }
    end

    context "uniqueness" do
      subject { FactoryBot.create(:dosen) }
      it { is_expected.to validate_uniqueness_of(:nidn).case_insensitive }
    end

    context "numericality" do
      it { is_expected.to validate_numericality_of(:nidn).only_integer }
    end

    context "associations" do
      it { is_expected.to have_one(:user) }

      it { is_expected.to accept_nested_attributes_for(:user) }
    end
  end
end
