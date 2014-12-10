class CreateGroupjoins < ActiveRecord::Migration
  def change
    create_table :groupjoins do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
    add_index :groupjoins, [:user_id, :group_id], unique: true
  end
end
