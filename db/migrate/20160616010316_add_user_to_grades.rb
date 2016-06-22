class AddUserToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :user, :references
  end
end
