class UniqueTitleInPosts < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :title, unique: true
  end
end
