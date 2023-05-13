class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.references :user, null: false, foreign_key: true
    end
  end
end
