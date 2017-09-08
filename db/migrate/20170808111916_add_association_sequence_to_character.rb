class AddAssociationSequenceToCharacter < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :sequence_id, :integer 
    add_index :characters, :sequence_id
  end
end
