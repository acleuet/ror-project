class AddCharacterSequences < ActiveRecord::Migration[5.0]
  def change
    create_table :character_sequences do |t|
      t.integer :character_id
      t.integer :sequence_id

      t.timestamps
    end
  end
end
