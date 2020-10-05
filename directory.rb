# Make Array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# Set variable
student_count = 11

# Header Method
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Footer Method
def print(students)
  students.each do |name|
    puts name
  end
end

# Print
def print_footer
  puts "Overall, we have #{student_count} great students"
end

print_header
print(students)
print_footer
