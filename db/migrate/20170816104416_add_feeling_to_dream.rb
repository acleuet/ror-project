class AddFeelingToDream < ActiveRecord::Migration[5.0]
  def change
     add_column :dreams, :feeling, :string
  end
end
