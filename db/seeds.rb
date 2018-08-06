(1..10).each do |n|
  User.create!(username: "student#{n}", password: "test")
end

teachers = (1..5).map do |n|
  User.create(username: "teacher#{n}", password: "test", role: 1)
end

User.create(username: "Admin", password: "test", role: 2)

teachers.each_with_index do |teacher, index|
  teacher.teacher.courses.create(title: "Course#{index}")
end

15.times do
  Enrollment.create!(course: Course.order("RANDOM()").first, student: Student.order("RANDOM()").first, grade: rand(1..4))
end
