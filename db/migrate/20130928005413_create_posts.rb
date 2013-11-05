class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content
      t.integer :comments_count
      t.string :tag
      t.references :category
      t.references :user

      t.timestamps
    end
  end
end
