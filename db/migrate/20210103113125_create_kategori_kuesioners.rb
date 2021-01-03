class CreateKategoriKuesioners < ActiveRecord::Migration[6.0]
  def change
    create_table :kategori_kuesioners do |t|
      t.string :nama, limit: 32

      t.timestamps
    end
    add_index :kategori_kuesioners, :nama, unique: true
  end
end
