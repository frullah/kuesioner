require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ItemKuesionersHelper. For example:
#
# describe ItemKuesionersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ItemKuesionersHelper, type: :helper do
  describe "#kategori_kuesioner_options" do
    it "should return all kategori kuesioner names" do
      ret = Object.new
      allow(KategoriKuesioner).to receive(:pluck).with(:nama, :id).and_return(ret)
      expect(helper.kategori_kuesioner_options).to be(ret)
    end
  end
end
