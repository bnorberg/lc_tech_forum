class RemoveStatusFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :status
  end

  def down
    add_column :comments, :status, :string
  end
end
