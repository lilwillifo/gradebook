class AddUniqueIndexToEnrollments < ActiveRecord::Migration[5.1]
  def change
    add_index :enrollments, [:student_id, :course_id], unique: true
  end
end
