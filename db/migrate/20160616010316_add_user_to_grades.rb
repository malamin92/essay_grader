class AddUserToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :user, :refernces
  end
end
