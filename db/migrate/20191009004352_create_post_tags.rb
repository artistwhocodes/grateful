class CreatePostTags < ActiveRecord::Migration[6.0]
  def change
    create_table :post_tags do |t|
      t.integer :post_id
      t.integer :tag_id
      t.string :primary
      t.string :secondary

      t.timestamps
    end
  end
end
