class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
