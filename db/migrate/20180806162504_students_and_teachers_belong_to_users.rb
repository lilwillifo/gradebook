class StudentsAndTeachersBelongToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :user, index: true
    add_reference :teachers, :user, index: true
  end
end
