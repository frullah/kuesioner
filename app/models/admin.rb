class Admin < ApplicationRecord
  has_one :user, as: :authenticatable
end
