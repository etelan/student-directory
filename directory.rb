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

# Puts Names
puts "The students of Villains Academy"
puts "-------------"
students.each do |name|
  puts name
end

# Print
puts "Overall, we have #{student_count} great students"
