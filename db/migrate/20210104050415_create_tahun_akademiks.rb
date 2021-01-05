class CreateTahunAkademiks < ActiveRecord::Migration[6.0]
  def change
    create_table :tahun_akademiks do |t|
      t.integer :tahun, limit: 2
      t.boolean :ganjil

      t.timestamps
    end
  end
end
