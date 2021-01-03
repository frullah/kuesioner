class CreateItemKuesioners < ActiveRecord::Migration[6.0]
  def change
    create_table :item_kuesioners do |t|
      t.references :kategori_kuesioner, null: false, foreign_key: true
      t.string :pertanyaan, limit: 80

      t.timestamps
    end
  end
end
