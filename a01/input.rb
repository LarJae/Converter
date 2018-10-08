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
    converter.get_table_arguments
  elsif choice == 2
    converter.get_input_and_tar_unit
  elsif choice == 3
    run = 0
    puts "Goodbye!"
  else
    puts "Invalid option"
  end
end
