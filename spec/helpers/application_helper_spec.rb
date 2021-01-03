require "rails_helper"

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "#render_menus" do
    it "should render menus" do
      user_stub = double("User")

      allow(helper).to receive(:current_user).and_return(user_stub)
      allow(user_stub).to receive(:authenticatable_type).and_return("Admin")

      expect(helper.render_menus).to eq(<<~HTML)
        <li class="nav-item">
          <a class="nav-link" href="#{mata_kuliahs_path}">Data Mata Kuliah</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#{prodis_path}">Data Prodi</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#{mahasiswas_path}">Data Mahasiswa</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#{dosens_path}">Data Dosen</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/#kategori-kuesioner">Data Kategori Kuesioner</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/#item-kuesioner">Data Item Kuesionr</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/#laporan-hasil-kuesioner">Laporan Hasil Kuesioner</a>
        </li>
      HTML
    end
  end
end
