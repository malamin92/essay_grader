class AddUserIdToEssays < ActiveRecord::Migration
  def change
    add_reference :essays, :user, index: true, foreign_key: true
  end
end
