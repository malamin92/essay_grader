class AddEssayGradeToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :grade, :string
  end
end
