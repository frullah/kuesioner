class ItemKuesioner < ApplicationRecord
  belongs_to :kategori_kuesioner
  has_many :respon_kuesioner
end
