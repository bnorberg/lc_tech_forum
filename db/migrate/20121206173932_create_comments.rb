class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
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
