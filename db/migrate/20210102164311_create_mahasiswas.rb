class CreateMahasiswas < ActiveRecord::Migration[6.0]
  def change
    create_table :mahasiswas do |t|
      t.string :nama, limit: 48, null: false
      t.string :npm, limit: 14, null: false, index: {unique: true}
      t.references :prodi, null: false, foreign_key: true

      t.timestamps
    end
  end
end
