class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :time
      t.string :day
      t.string :room
      t.integer :user_id
      t.text :about

      t.timestamps
    end
  end
end
