=begin
# Student While
def print_while(students)

  # Counter
  max_counter = students.length


  while max_counter > 0

    # Lower Counter
    max_counter -= 1

    # Get the number
    num = students.length - max_counter

    # Puts the line
    puts num.to_s + ". name: " + students.reverse[max_counter] + " cohort: november"
  end
end

# Student First Character Filter
def print_char_filter(students)

  # Get char to search for
  puts "Input character to search for."
  char = gets.chomp

  # Start Loop
  students.each do |name|

    # Char?
    if name[0] = char
      # Get the number
      num = students.find_index(name) + 1

      # Puts the line
      puts num.to_s + ". name: " + name + " cohort: november"
    end

  # End Loop
  end
end


# Student Length Filter
def print_length_filter(students)

  # Get char to search for
  puts "Input length to be less than or equal to."
  char = gets.chomp.to_i

  # Start Loop
  students.each do |name|

    # Char?
    if name.length <= char
      # Get the number
      num = students.find_index(name) + 1

      # Puts the line
      puts num.to_s + ". name: " + name + " cohort: november"
    end

  # End Loop
  end
end
=end

# Header Method
def print_header
  puts "The students of Villains Academy".center(50, '~')
  puts "-------------".center(50)
end

# Input Students Method
def input_students

  # Make Array
  students = []

  # Start Loop
  while true

    # Ask for input
    puts "Input the student name.".center(50)
    puts "To finish, hit return twice".center(50)

    # Get input
    name = gets.chomp

    # If they enter a name, save the name
    if name != ""

      # Cohort
      puts "Input the student cohort.".center(50)
      cohort = gets.chomp

      # Hobby num
      puts "Input the number of student hobbies.".center(50)
      hobbies_num = gets.chomp.to_i

      # Hobby array
      hobby = []

      (1..hobbies_num).each do |i|
        # Hobby Value
        puts "Input the hobby value.".center(50)
        hobby.push(gets.chomp)
      end

      # Country
      puts "Input the student country.".center(50)
      country = gets.chomp

      # Height
      puts "Input the student height.".center(50)
      height = gets.chomp

      # Make Hash
      hash = {
        :name => name,
        :cohort => cohort,
        :hobby => hobby,
        :country => country,
        :height => height
      }

      # Push
      students.push(hash)

    else
      break
    end

  # End Loop
  end

  # Return Array
  return students
end

# Student Normal
def print(students)

  # Loop Over Array
  students.each do |hash|

    # Get the number
    num = students.find_index(hash) + 1

    # Start String
    line = num.to_s + ". "

    # Loop Over Hash
    hash.each do |key, value|

      # Add to line
      if value.is_a? String
        line = line + key.to_s + ": " + value.to_s + ", "
      else
        line = line + key.to_s + ": " + value.join(", ") + ", "
      end

    # End Loop Hash
    end

    # Correct Check
    puts "Would you like to make changes? y/n".center(50)
    ans = gets.chomp

    # Correct?
    if ans.downcase == "y"
      changes(students)
    end

    # Puts the line
    puts line.center(50)
  end
end

def changes(students)

  # Get the name reference
  puts "Enter name reference.".center(50, '~')
  name = gets.chomp

  students.each do |hash|
    if hash[:name] == name
      puts hash
    end
  end
end


# Print
def print_footer(students)
  student_count = students.length
  puts "Overall, we have #{student_count} great students".center(50)
end

# Run our code
print_header
array = input_students
print(array)
print_footer(array)
