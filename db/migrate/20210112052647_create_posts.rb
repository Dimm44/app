class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.string :lead
      t.string :image
      t.text :content
    end
  end
end
