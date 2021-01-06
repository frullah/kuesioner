class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  belongs_to :authenticatable, polymorphic: true

  validates :username, uniqueness: true, presence: true

  def email_required?
    false
  end
end
