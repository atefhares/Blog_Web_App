class AddForignKeyPostsUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :posts, :users, index: true
  end
end
