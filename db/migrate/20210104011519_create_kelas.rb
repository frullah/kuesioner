class CreateKelas < ActiveRecord::Migration[6.0]
  def change
    create_table :kelas do |t|
      t.string :nama, limit: 32
      t.references :prodi, null: false, foreign_key: true

      t.timestamps
    end
  end
end
