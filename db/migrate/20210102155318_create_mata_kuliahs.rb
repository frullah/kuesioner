class CreateMataKuliahs < ActiveRecord::Migration[6.0]
  def change
    create_table :mata_kuliahs do |t|
      t.string :nama, limit: 48, index: {unique: true}
      t.integer :sks, limit: 1
      t.integer :semester, limit: 1

      t.timestamps
    end
  end
end
