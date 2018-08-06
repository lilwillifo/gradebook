class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters do |t|
      t.integer :session
      t.integer :year
    end
  end
end
