class CreateJadwalMataKuliahs < ActiveRecord::Migration[6.0]
  def change
    create_table :jadwal_mata_kuliahs do |t|
      t.references :mata_kuliah, null: false, foreign_key: true
      t.references :dosen, null: false, foreign_key: true
      t.references :tahun_akademik, null: false, foreign_key: true
      t.references :kelas, null: false, foreign_key: true
      t.integer :hari, limit: 1, null: false
      t.time :waktu, null: false

      t.timestamps


      t.index [
        :mata_kuliah_id, 
        :dosen,
        :tahun_akademik,
        :kelas
      ], unique: true, name: "index_jadwal_mata_kuliah"
    end
  end
end
