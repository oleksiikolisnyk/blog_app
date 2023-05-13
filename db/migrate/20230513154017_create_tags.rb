class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references :post, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
