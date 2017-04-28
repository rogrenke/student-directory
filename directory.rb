def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, hobbies: "Being evil", country_of_birth: "World", height: "2.00m" }
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
  idx = 0
  while idx < students.length
    puts "#{idx+1}. #{students[idx][:name]} (#{students[idx][:cohort]} cohort, hobbies: #{students[idx][:hobbies]}, country of birth: #{students[idx][:country_of_birth]}, height: #{students[idx][:height]}) "
    idx += 1
  end
end

def print_by_letter(students)
  puts "Please give the starting letter for the students"
  input = gets.chomp
  puts "Those are the students starting with '#{input}'"
  students.each_with_index do |student, idx|
    if input[0].downcase == student[:name][0].downcase
      puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies: #{student[:hobbies]}, country of birth: #{student[:country_of_birth]}, height: #{student[:height]})"
    end
  end
end

def print_12_chars(students)
  puts "Those are the students whose name is 12 characters long or shorter"
  students.each_with_index do |student, idx|
    if student[:name].length <= 12
      puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies: #{student[:hobbies]}, country of birth: #{student[:country_of_birth]}, height: #{student[:height]})"
    end
  end
end
# finally, printing total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
