class CreateResponKuesioners < ActiveRecord::Migration[6.0]
  def change
    create_table :respon_kuesioners do |t|
      t.references :mahasiswa, null: false, foreign_key: true
      t.references :dosen, null: false, foreign_key: true
      t.references :item_kuesioner, null: false, foreign_key: true
      t.integer :nilai, limit: 1

      t.timestamps

      t.index [:mahasiswa_id, :dosen_id, :item_kuesioner_id],
        name: "respon_kuesioner_idx",
        unique: true
    end
  end
end
