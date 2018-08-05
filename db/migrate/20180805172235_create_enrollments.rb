class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.float :grade
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
