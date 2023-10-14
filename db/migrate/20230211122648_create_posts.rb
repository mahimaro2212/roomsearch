class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :time
      t.string :day
      t.string :room

      t.timestamps
    end
  end
end
