class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :nama, limit: 64

      t.timestamps
    end
  end
end
