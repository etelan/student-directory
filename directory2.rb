# CSV Import
require 'csv'
@students = [{:name => "name", :cohort => "cohort", :country => "country", :hobby => "hobby", :height => "height"}]

# DEFINE METHOD
def print_header
  puts "The students of Villains Academy".center(50, '~')
  puts "-------------".center(50)
end

def ask(text = '')
  puts "#{text}".center(50)
  return STDIN.gets.chomp
end

# DEFINE INPUT STUDENTS
def input_students()

  # Start Loop
  while true

    # Ask for input
    puts "Input the student name.".center(50)

    # Get input
    name = ask("To finish, hit return twice")

    # If they enter a name, save the name
    if name != ""

      # Cohort
      cohort = ask("Input the student cohort.")

      # hobbies
      hobby = ask("Input the hobby value. (seperated by '-')")

      # Country
      country = ask("Input the student country.")

      # Height
      height = ask("Input the student height.")

      # Make Hash
      hash = {
        :name => name,
        :cohort => cohort,
        :hobby => hobby,
        :country => country,
        :height => height
      }

      # Push
      @students.push(hash)

    else
      break
    end

  # End Loop
  end

  # Return Array
  return @students
end

# DEFINE PRINT NORMAL
def print_names()

  # Loop Over Array
  @students.each do |hash|

      if hash[:name] != 'name'
        puts "name: " + hash[:name].to_s + ", cohort: " + hash[:cohort].to_s +
        ", hobbies: " + hash[:hobby].to_s + ", country: " + hash[:country].to_s
      end

  # End Array Loop
  end

  # Correct Check
  ans = ask("Would you like to make changes? y/n")

  # Correct?
  if ans.downcase == "y"
    changes
  else
    print_footer
  end

end

# DEFINE CHANGE
def changes()

  # Get the name reference
  puts "Enter name reference.".center(50, '~')
  name = ask()

  # Loop to find our hash
  @students.each do |hash|
    if hash[:name] == name

      # Display them the menu, process
      select = edit_menu

      case select

      when 1
        hash[:name] = ask("Write new Name")
      when 2
        hash[:cohort] = ask("Write new Cohort")
      when 3
        hash[:hobbies] = ask("Write new Hobbies")
      when 4
        hash[:country] = ask("Write new Country")
      when 5
        hash[:height] = ask("Write new Height")

      # Case End
      end
    # Name Check End
    end
  # Loop Hashes End
  end

  # Print @students again
  print_names()

# Method End
end

# DEFINE EDIT PRINT
def edit_print
  # Print a nice menu
  puts "Submit a number for the change".center(50)
  puts "1. Name"
  puts "2. Cohort"
  puts "3. Hobbies"
  puts "4. Country"
  puts "5. Height"
end

# DEFINE EDIT MENU
def edit_menu

  while true

    edit_print
    selection = ask().to_i

    # return
    if (selection <= 5) && (selection > 0)
      return selection
    end
  end
end

# DEFINE PRINT
def print_footer()
  student_count = @students.length

  # Grammar Plural
  if student_count > 1
    puts "Overall, we have #{student_count} great students".center(50)

  # Grammer None
  elsif student_count == 0
    puts "Overall, we have no students".center(50)

  # Grammar Singular
  else
    puts "Overall, we have #{student_count} great student".center(50)
  end

end

# DEFINE PROCESS
def process(selection)
  case selection
  when 1
    input_students
  when 2
    show_students
  when 3
    save_students
  when 9
    puts "Exiting..."
    exit
  end
end

# DEFINE SAVE GENERAL
def save_students

  # Open Specified
  if !(ARGV.empty?)
    csv = CSV.open(ARGV.first, "wb") do |csv|
      @students.each do |hash|
        csv << [hash[:name], hash[:cohort], hash[:hobby],
        hash[:country], hash[:height]]
      end
    end
  # Open Default
  else
    CSV.open("students.csv", "wb") do |csv|
      @students.each do |hash|
        csv << [hash[:name], hash[:cohort], hash[:hobby],
        hash[:country], hash[:height]]
      end
    end
  end
  # Feedback Message
  puts "Saved."
end


# DEFINE SHOW STUDENTS
def show_students
  print_header
  print_names
end

# DEFINE LOAD STUDENTS
def load_students

  # Open File, set our headers
  if !(ARGV.empty?)
    table = CSV.parse(File.read(ARGV.first), write_headers: true, :headers => ['name','cohort','hobby', 'country', 'height'])
  else
    table = CSV.parse(File.read("students.csv"), write_headers: true, :headers => ['name','cohort','hobby', 'country', 'height'])
  end


  # puts just name,cohort,hobby,country,height

  for num in 0..(table.length - 1) do
    # Set Student Variable
    @students << {:name => table[num]['name'],
      :cohort => table[num]['cohort'], :country => table[num]['country'],
      :hobby => table[num]['hobby'], :height => table[num]['height']}
  end

end

# DEFINE INTERACTIVE PRINT
def interactive_print
  puts "Please select your option.".center(50,'~')
  puts "1. Input Students".center(50)
  puts "2. Show the Students".center(50)
  puts "3. Save the Students".center(50)
  puts "9. Exit".center(50)
end

# DEFINE INTERACTIVE MENU
def interactive_menu()

  loop do

    # Print Options
    interactive_print

    # Ask for input
    process(ask().to_i)

  end
end

# RUN CODE
if (File.file?("students.csv")) || (File.file?(ARGV.first.to_s))
  load_students
end

# Start Main Script
interactive_menu
