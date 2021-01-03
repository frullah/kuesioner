require 'rails_helper'

RSpec.describe "item_kuesioners/edit", type: :view do
  before(:each) do
    @item_kuesioner = assign(:item_kuesioner, ItemKuesioner.create!(
      kategori_kuesioner: nil,
      pertanyaan: "MyString"
    ))
  end

  it "renders the edit item_kuesioner form" do
    render

    assert_select "form[action=?][method=?]", item_kuesioner_path(@item_kuesioner), "post" do

      assert_select "input[name=?]", "item_kuesioner[kategori_kuesioner_id]"

      assert_select "input[name=?]", "item_kuesioner[pertanyaan]"
    end
  end
end
