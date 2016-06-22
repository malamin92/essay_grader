class AddUserToEssays < ActiveRecord::Migration
  def change
    add_column :essays, :user, :refernces
  end
end
