class AddRoleToUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_default :cart_items, :quantity, 0
    change_column_null :cart_items, :quantity, false
  end
end
