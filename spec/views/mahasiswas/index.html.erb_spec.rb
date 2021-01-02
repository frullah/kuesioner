require "rails_helper"

RSpec.describe "mahasiswas/index", type: :view do
  before(:each) do
    allow(view).to receive(:edit_mahasiswa_path)
    @mahasiswas = assign(:mahasiswas, FactoryBot.build_list(:mahasiswa, 2))
  end

  it "renders a list of mahasiswas" do
    render
    assert_select "tbody>tr" do |elements|
      elements.each_with_index do |element, index|
        assert_select "td", text: @mahasiswas[index].nama
        assert_select "td", text: @mahasiswas[index].npm
        assert_select "td", text: @mahasiswas[index].prodi.nama
      end
    end
  end
end
