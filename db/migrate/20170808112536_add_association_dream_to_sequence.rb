class AddAssociationDreamToSequence < ActiveRecord::Migration[5.0]
  def change
    add_column :sequences, :dream_id, :integer 
    add_index :sequences, :dream_id
  end
end
