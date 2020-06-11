class CreateUserBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_bookmarks do |t|
      t.string :author
      t.string :content
      t.string :description
      t.string :published_at
      t.string :title
      t.string :url
      t.string :urlToImage
      t.string :user_id

      t.timestamps
    end
  end
end
