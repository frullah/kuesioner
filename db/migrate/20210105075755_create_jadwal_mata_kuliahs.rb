class CreateJadwalMataKuliahs < ActiveRecord::Migration[6.0]
  def change
    create_table :jadwal_mata_kuliahs do |t|
      t.references :mata_kuliah, null: false, foreign_key: true
      t.references :dosen, null: false, foreign_key: true
      t.references :tahun_akademik, null: false, foreign_key: true
      t.references :kelas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
