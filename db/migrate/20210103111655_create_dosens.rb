class CreateDosens < ActiveRecord::Migration[6.0]
  def change
    create_table :dosens do |t|
      t.string :nidn, limit: 14, null: false, index: {unique: true}
      t.string :nama, limit: 48, null: false
      t.string :pendidikan, limit: 2

      t.timestamps
    end
  end
end
