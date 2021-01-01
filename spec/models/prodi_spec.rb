require 'rails_helper'

RSpec.describe Prodi, type: :model do
  describe "validations" do
    context "uniqueness" do
      subject { FactoryBot.create(:prodi) }
      it { is_expected.to validate_uniqueness_of(:nama) }
    end
  end
end
