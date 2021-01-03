require 'rails_helper'

RSpec.describe "item_kuesioners/index", type: :view do
  before(:each) do
    assign(:item_kuesioners, [
      ItemKuesioner.create!(
        kategori_kuesioner: nil,
        pertanyaan: "pertanyaan"
      ),
      ItemKuesioner.create!(
        kategori_kuesioner: nil,
        pertanyaan: "pertanyaan"
      )
    ])
  end

  it "renders a list of item_kuesioners" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "pertanyaan".to_s, count: 2
  end
end
