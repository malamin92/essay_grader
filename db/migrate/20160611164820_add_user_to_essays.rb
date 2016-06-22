class AddUserToEssays < ActiveRecord::Migration
  def change
    add_column :essays, :user, :references
  end
end
