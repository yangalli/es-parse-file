class Quiz1
  lines = File.readlines("../engsoft.txt")
  students = []
  correct_students = []

  def self.transform_file_to_array_of_strings(file_lines, students)
    file_lines.each do |line|
      students.append line
    end
  end

  def self.turn_student_to_string(student, correct_students)
    if student != [] && student[0][0] === "1"
      student_string = ""

      student.each do |word|
        student_string << word + " "
      end

      student_string = student_string + "\n"

      correct_students << student_string
    end
  end

  def self.create_final_students_string(students)
    students = students.join()
  end

  transform_file_to_array_of_strings(lines, students)

  students.each do |student|
    clean_student = student.split(" ")

    turn_student_to_string(clean_student, correct_students)
  end

  create_final_students_string(correct_students)

  correct_students = correct_students.join()

  File.open('engsoft-parsed.txt', 'w') { |file| file.write(correct_students) }
end
