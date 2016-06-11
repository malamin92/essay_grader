class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :essay, index: true, foreign_key: true
      t.text :comments
      t.string :grader

      t.timestamps null: false
    end
  end
end
