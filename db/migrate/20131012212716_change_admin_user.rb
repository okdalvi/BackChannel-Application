class ChangeAdminUser < ActiveRecord::Migration
  def up
    change_column :users, :admin, :integer
  end

  def down
    change_column :users, :admin, :boolean
  end
end
