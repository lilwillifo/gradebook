class AddSemesterToCourse < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :semester, foreign_key: true
  end
end
