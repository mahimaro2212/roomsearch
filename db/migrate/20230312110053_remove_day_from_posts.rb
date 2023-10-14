class RemoveDayFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :day, :string
  end
end
