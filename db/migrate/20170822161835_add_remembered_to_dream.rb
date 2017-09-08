class AddRememberedToDream < ActiveRecord::Migration[5.0]
  def change
    add_column :dreams, :remembered, :boolean
  end
end
