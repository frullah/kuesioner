require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MataKuliahsHelper. For example:
#
# describe MataKuliahsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MataKuliahsHelper, type: :helper do
  describe "#prodi_options" do
    it "should return all prodi names" do
      ret = Object.new
      allow(Prodi).to receive(:pluck).with(:nama, :id).and_return(ret)
      expect(helper.prodi_options).to be(ret)
    end
  end
end
