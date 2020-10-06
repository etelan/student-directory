
# Instance Variable Initialize
if !(File.file?("students.csv")) and !(File.file?(ARGV.first.to_s))
  @students = [{:name => "name", :cohort => "cohort", :country => "country", :hobby => "hobby", :height => "height"}]
else
  @students = []
end

# DEFINE PRINT COHORT
def print_cohort()
  # Cohort Array
  cohort = []

  # Grab Cohorts
  @students.each do |hash|

    # Add to array if not include
    if !(cohort.include? (hash[:cohort]))
      cohort.push(hash[:cohort])
    end

  # End @students
  end

  # Cohort Cycle
  cohort.each do |name|

    # Title Puts
    puts name.center(50, '-')

    # Student Loop
    @students.each do |hash|
      if hash[:cohort] == name
        puts hash[:name]
      end
    end
  end
end

# DEFINE METHOD
def print_header
  puts "The students of Villains Academy".center(50, '~')
  puts "-------------".center(50)
end

# DEFINE INPUT STUDENTS
def input_students()

  # Start Loop
  while true

    # Ask for input
    puts "Input the student name.".center(50)
    puts "To finish, hit return twice".center(50)

    # Get input
    name = STDIN.gets.chomp

    # If they enter a name, save the name
    if name != ""

      # Cohort
      puts "Input the student cohort.".center(50)
      cohort = STDIN.gets.chomp

      # hobbies
      puts "Input the hobby value. (seperated by '-')".center(50)
      hobby = STDIN.gets.chomp

      # Country
      puts "Input the student country.".center(50)
      country = STDIN.gets.chomp

      # Height
      puts "Input the student height.".center(50)
      height = STDIN.gets.chomp

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

    # Get the number
    num = @students.find_index(hash)

    # Start String
    line = num.to_s + ". "

    # Make sure we dont print our title
    if num > 0

      # Loop Over Hash, print line
      hash.each do |key, value|
        if key == :height
          line = line + key.to_s + ": " + value.to_s + " "
        else
          line = line + key.to_s + ": " + value.to_s + ", "
        end

      # End Loop Hash
      end

      # Puts the line
      puts line.center(50)

    end

  # End Array Loop
  end

  # Correct Check
  ans = ""
  puts "Would you like to make changes? y/n".center(50)
  ans = STDIN.gets.chomp

  # Correct?
  if ans.downcase == "y"
    changes()
  else
    print_footer
  end

end

# DEFINE CHANGE
def changes()

  # Get the name reference
  puts "Enter name reference.".center(50, '~')
  name = STDIN.gets.chomp

  # Loop to find our hash
  @students.each do |hash|
    if hash[:name] == name

      # Display them the menu, process
      select = edit_menu

      case select

      when 1
        puts "Write new Name"
        hash[:name] = STDIN.gets.chomp
      when 2
        puts "Write new Cohort"
        hash[:cohort] = STDIN.gets.chomp
      when 3
        puts "Write new Hobbies"
        hash[:hobbies] = STDIN.gets.chomp
      when 4
        puts "Write new Country"
        hash[:country] = STDIN.gets.chomp
      when 5
        puts "Write new Height"
        hash[:height] = STDIN.gets.chomp

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

# DEFINE EDIT MENU
def edit_menu

  while true
    # Print a nice menu
    puts "Submit a number for the change".center(50)
    puts "1. Name"
    puts "2. Cohort"
    puts "3. Hobbies"
    puts "4. Country"
    puts "5. Height"
    selection = STDIN.gets.chomp.to_i

    # return
    if (selection <= 5) and (selection > 0)
      return selection
    end
  end
end

# DEFINE PRINT
def print_footer()
  student_count = @students.length - 1

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
    exit
  end
end

# DEFINE SAVE GENERAL
def save_students

  # Open File
  if !(ARGV.empty?)
    file = File.open(ARGV.first, "w")
  else
    file = File.open("students.csv", "w")
  end

  # Loop Hash
  @students.each do |hash|

    # Arrays to save
    student_data = [hash[:name], hash[:cohort], hash[:hobby],
    hash[:country], hash[:height]]

    # Lines to write
    csv_line = student_data.join(',')

    # Save them
    file.puts csv_line
  end

  # Close File
  file.close
end


# DEFINE SHOW STUDENTS
def show_students
  print_header
  print_names
end

# DEFINE LOAD STUDENTS
def load_students

  # Open File
  if !(ARGV.empty?)
    file = File.open(ARGV.first, "r")
  else
    file = File.open("students.csv", "r")
  end

  # READ Student.csv
  file.readlines.each do |line|
    # Set Student Variables
    name, cohort, hobby, country, height = line.chomp.split(',')
    @students << {:name => name, :cohort => cohort, :country => country, :hobby => hobby, :height => height}
  end
  file.close
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
    process(STDIN.gets.chomp.to_i)

  end
end

# RUN CODE
# If the file , load it
load_students

# Start Main Script
interactive_menu
