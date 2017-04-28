def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts("The students of Villains Academy")
  puts ("-----------")
end

def print(students)
  students.each_with_index do |student, idx|
    puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_by_letter(students)
  puts "Please give the starting letter for the students"
  input = gets.chomp
  puts "Those are the students starting with '#{input}'"
  students.each_with_index do |student, idx|
    if input[0].downcase == student[:name][0].downcase
      puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
# finally, printing total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_by_letter(students)
print_footer(students)
