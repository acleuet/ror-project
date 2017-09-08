class AddPlaceSequences < ActiveRecord::Migration[5.0]
  def change
    create_table :place_sequences do |t|
      t.integer :place_id
      t.integer :sequence_id

      t.timestamps
    end
  end
end
