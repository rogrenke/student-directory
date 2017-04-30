def interactive_menu
  months = ["january","february","march","april","may","june","july","august","september","october","november","december","unknown"]
  students = []
  loop do
    # 1. print the menu and ask user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. Perform the task
    case selection
    when "1"
      students = input_students(months)
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again (type a number between 1 and 9)."
    end
  end
end

def input_students(months)
  puts "Please enter the names of the students and their cohort month"
  puts "To finish, just hit return twice"
  students = []
  puts "Name?"
  name = gets.delete!("\n")
  puts "Cohort Month?"
  cohort = gets.delete!("\n")
  while true do
    if name.empty? && cohort.empty?
      return students
    elsif cohort.empty?
      cohort = :Unknown
    elsif name.empty?
      name = "Anonymous"
    end

    while !months.include?(cohort.to_s.downcase)
      puts "That's not a valid month. Please re-enter the cohort month"
      cohort = gets.delete!("\n")
      if cohort.empty?
        cohort = :Unknown
      end
    end
    students << {name: name, cohort: cohort.to_sym, hobbies: "Being evil", country_of_birth: "World", height: "2.00m" }

    if students.count == 1
      puts "We have 1 great student"
    else
      puts "Overall, we have #{students.count} great students"
    end

    name = nil
    cohort = nil
    puts "Name?"
    name = gets.delete!("\n")
    puts "Cohort?"
    cohort = gets.delete!("\n")
  end
  students
end

def print_header
  puts("The students of Villains Academy")
  puts ("-----------")
end

def print(students)
  idx = 0
  name_lengths = []
  students.each do |student|
    name_lengths << student[:name].length
  end
  while idx < students.length
    str = "#{idx+1}. #{students[idx][:name]} (#{students[idx][:cohort]} cohort, hobbies: #{students[idx][:hobbies]}, country of birth: #{students[idx][:country_of_birth]}, height: #{students[idx][:height]})"
    puts str.center(str.length-students[idx][:name].length+name_lengths.max+20)
    idx += 1
  end
end

def print_by_cohort(students,months)
  puts "(sorted by cohort)"
  months.each do |month|
    students.each_with_index do |student|
      if month == student[:cohort].to_s.downcase
        puts "#{student[:name]} (#{student[:cohort]} cohort, hobbies: #{student[:hobbies]}, country of birth: #{student[:country_of_birth]}, height: #{student[:height]})"
      end
    end
  end
end

def print_by_letter(students)
  puts "Please give the starting letter for the students"
  input = gets.gets.delete!("\n")
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
  if students.count == 1
    puts "We have 1 great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

interactive_menu
