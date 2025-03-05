class CreateBaskets < ActiveRecord::Migration[8.0]
  def change
    create_table :baskets do |t|
      t.decimal :total_price

      t.timestamps
    end
  end
end
