class Prodi < ApplicationRecord
  validates :nama, uniqueness: true, presence: true
end
