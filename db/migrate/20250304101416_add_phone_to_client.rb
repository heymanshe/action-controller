class AddPhoneToClient < ActiveRecord::Migration[8.0]
  def change
    add_column :clients, :phone, :string
  end
end
