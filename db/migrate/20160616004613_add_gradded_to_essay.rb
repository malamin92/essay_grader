class AddGraddedToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :gradded, :boolean
  end
end
