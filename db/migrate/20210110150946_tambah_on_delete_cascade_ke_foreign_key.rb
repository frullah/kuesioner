class TambahOnDeleteCascadeKeForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :respon_kuesioners, :mahasiswas
    add_foreign_key :respon_kuesioners, :mahasiswas, on_delete: :cascade
  end
end
