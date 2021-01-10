class KategoriKuesioner < ApplicationRecord
  has_many :item_kuesioner
  has_many :respon_kuesioner, through: :item_kuesioner
end
