require 'rails_helper'

RSpec.describe "item_kuesioners/new", type: :view do
  before(:each) do
    assign(:item_kuesioner, ItemKuesioner.new(
      kategori_kuesioner: nil,
      pertanyaan: "MyString"
    ))
  end

  it "renders new item_kuesioner form" do
    render

    assert_select "form[action=?][method=?]", item_kuesioners_path, "post" do

      assert_select "input[name=?]", "item_kuesioner[kategori_kuesioner_id]"

      assert_select "input[name=?]", "item_kuesioner[pertanyaan]"
    end
  end
end
