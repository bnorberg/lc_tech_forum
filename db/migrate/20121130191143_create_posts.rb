class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.text :patron_request
      t.text :consultation_summary
      t.string :resources_used
      t.string :status

      t.timestamps
    end
  end
end
