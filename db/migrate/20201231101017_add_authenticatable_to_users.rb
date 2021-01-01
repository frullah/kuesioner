class AddAuthenticatableToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :authenticatable, polymorphic: true, index: true
  end
end
