class CreateProdis < ActiveRecord::Migration[6.0]
  def change
    create_table :prodis do |t|
      t.string :nama, limit: 32

      t.timestamps
    end
  end
end
