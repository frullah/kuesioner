require 'rails_helper'

RSpec.describe ResponKuesioner, type: :model do
  describe "validations" do
    context "uniqueness" do
      subject { FactoryBot.create(:respon_kuesioner) }
      it { is_expected.to validate_uniqueness_of(:mahasiswa)
        .scoped_to([:dosen_id, :item_kuesioner_id]) }
  end
end
