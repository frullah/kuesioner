require 'rails_helper'

RSpec.describe "prodis/edit", type: :view do
  before(:each) do
    @prodi = assign(:prodi, Prodi.create!(
      nama: "MyString"
    ))
  end

  it "renders the edit prodi form" do
    render

    assert_select "form[action=?][method=?]", prodi_path(@prodi), "post" do

      assert_select "input[name=?]", "prodi[nama]"
    end
  end
end
