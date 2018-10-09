# Authors Lennart Draeger, Lars Jaeckel
require_relative 'conversion.rb'
converter = Converter.new

# This while loop lets the user decide if he wants to create a table, convert a specific length or exit the program.

run = 1
while run == 1
  puts"If you want to create a table press <1>"
  puts"If you want to convert a specific length press <2>"
  puts "If you want to exit the program press <3>"
  choice = gets.chomp.to_i

  if choice == 1
    puts "Enter the starting value of the table."
    number = gets.chomp.to_f
    puts"Enter the step size of the table."
    step_size = gets.chomp.to_f
    puts "Enter the finishing value of the table."
    finish = gets.chomp.to_f
    puts "Enter the unit you wish to convert from."
    unit = gets.chomp
    puts "Enter the unit you wish to convert to."
    tar_unit = gets.chomp
    converter.make_a_table(number, step_size, finish, unit, tar_unit)
  elsif choice == 2
    puts "Enter value and unit you wish to convert (i.e. 42mm or 11 inch): "
    input = gets.chomp
    number = input.to_f
    unit = input.downcase.gsub(/[0-9]/, '').gsub('.', '').gsub(' ', '')
    puts "Enter the unit you wish to convert to (i.e.: m, km, mile, feet): "
    tar_unit = gets.chomp.downcase
    converter.specific_unit_output(number, unit, tar_unit)
  elsif choice == 3
    run = 0
    puts "Goodbye!"
  else
    puts "Invalid option"
  end
end
