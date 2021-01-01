class CreateProdis < ActiveRecord::Migration[6.0]
  def change
    create_table :prodis do |t|
      t.string :nama, limit: 32, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
