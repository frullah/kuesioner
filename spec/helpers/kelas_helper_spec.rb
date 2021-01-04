require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the KelasHelper. For example:
#
# describe KelasHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe KelasHelper, type: :helper do
  it { is_expected.to include(MataKuliahsHelper) }
end
