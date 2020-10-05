# Header Method
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Student Normal
def print(students)
  students.each do |name|

    # Get the number
    num = students.find_index(name) + 1

    # Puts the line
    puts num.to_s + ". name: " + name + " cohort: november"
  end
end

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

# Input Students Method
def input_students

  # Make Array
  students = []

  # Start Loop
  while true

    # Ask for input
    puts "Input the student name."
    puts "To finish, hit return twice"

    # Get input
    name = gets.chomp

    if name != ""
      students.push(name)
    else
      break
    end

  # End Loop
  end

  # Return Array
  return students
end


# Print
def print_footer(students)
  student_count = students.length
  puts "Overall, we have #{student_count} great students"
end

# Run our code
array = input_students
print_header
print_while(array)
print_footer(array)
