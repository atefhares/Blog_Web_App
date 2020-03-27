class AddTimestampsToComments < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      t.timestamps
    end
  end
end
