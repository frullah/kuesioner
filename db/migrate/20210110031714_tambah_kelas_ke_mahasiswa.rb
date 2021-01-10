class TambahKelasKeMahasiswa < ActiveRecord::Migration[6.0]
  def change
    add_reference :mahasiswas, :kelas, null: false, foreign_key: true
  end
end
