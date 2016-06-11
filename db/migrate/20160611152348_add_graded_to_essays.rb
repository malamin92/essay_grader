class AddGradedToEssays < ActiveRecord::Migration
  def change
    add_column :essays, :grade, :string
  end
end
