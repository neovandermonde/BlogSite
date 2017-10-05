class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
      t.string :title
      t.string :image_url
      t.text :blog
      t.datetime :date_posted
      t.string :creator

      t.timestamps null: false
    end
  end
end
