class AddTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :chefs, :token, :string
  end
end
