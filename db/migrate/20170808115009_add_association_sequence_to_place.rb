class AddAssociationSequenceToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :sequence_id, :integer 
    add_index :places, :sequence_id
  end
end
