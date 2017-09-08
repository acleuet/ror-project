class AddAssociationUserToDream < ActiveRecord::Migration[5.0]
  def change
    add_column :dreams, :user_id, :integer 
    add_index :dreams, :user_id
  end
end

