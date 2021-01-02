class Mahasiswa < ApplicationRecord
  belongs_to :prodi
  has_one :user, as: :authenticatable, dependent: :destroy

  accepts_nested_attributes_for :user

  validates :nama, presence: true, length: {maximum: 48}
  validates :npm, uniqueness: true, presence: true, length: {maximum: 14}, numericality: {only_integer: true}

  before_create do
    self.user ||= User.new
    self.user.username = npm
  end
end
