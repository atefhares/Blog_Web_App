class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.timestamps
    end

    add_reference :comments, :post, index: true
    add_reference :comments, :user, index: true
    add_foreign_key :comments, :posts, index: true
    add_foreign_key :comments, :users, index: true

    change_column_null :comments, :user_id, null: false
    change_column_null :comments, :post_id, null: false

  end
end
