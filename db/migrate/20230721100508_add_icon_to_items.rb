class AddIconToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :icon, :string
  end
end
