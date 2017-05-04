require 'csv'
@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
      puts "Students' list saved!"
    when "4"
      load_students(filename_to_load)
      puts "Students' list loaded!"
    when "9"
      exit
    else
      puts "I don't know what you mean, try again."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
  while !name.empty? do
    add_to_array(name,cohort=:november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def print_header
  puts("The students of Villains Academy")
  puts ("-----------")
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# finally, printing total number of students
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Please enter a filename with .csv ending"
  input = gets.chomp
  CSV.open(input, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file << student_data
    end
  end
end

def try_load_students
  filename = ARGV.first
  return if ARGV.first.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist"
    exit
  end
end

def filename_to_load
  puts "Please enter the filename with .csv ending"
  filename = gets.chomp
  if !File.exists?(filename)
    puts "This file does not exist"
    return "students.csv"
  end
  filename
end

def load_students(filename)
  CSV.foreach(filename) do |line|
    name, cohort = line
    add_to_array(name,cohort)
  end
end

def add_to_array(name,cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
