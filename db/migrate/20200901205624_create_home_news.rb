class CreateHomeNews < ActiveRecord::Migration[6.0]
  def change
    create_table :home_news do |t|
      t.string :author
      t.string :content
      t.string :description
      t.string :published_at
      t.string :title
      t.string :url
      t.string :url_to_image
      t.timestamps
    end
  end
end
