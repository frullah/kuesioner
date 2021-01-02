class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  belongs_to :authenticatable, polymorphic: true

  # validates :password, presence: true, length: {maximum: 48, minimum: 8}, on: :create
  # validates :password, presence: true, length: {maximum: 48, minimum: 8}, on: :update, if: :password_changed?

  def email_required?
    false
  end
end
