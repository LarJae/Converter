# Authors:: Lennart Draeger, Lars Jaeckel
require 'bigdecimal'
class Converter

  # This method reads values from the console, stores them in variables
  # and calls the converter method within a printf function to print out the result.
  def get_input_and_tar_unit
    puts "Enter value and unit you wish to convert (i.e. 42mm or 11 inch): "
    input = gets.chomp
    number = input.to_f
    unit = input.downcase.gsub(/[0-9]/, '').gsub('.', '').gsub(' ', '')
    unit = viability_check_unit(unit)

    puts "Enter the unit you wish to convert to (i.e.: m, km, mile, feet): "
    tar_unit = gets.chomp.downcase
    tar_unit = viability_check_unit(tar_unit)

    printf "#{number}#{unit} = #{(converter(number, unit, tar_unit))} #{tar_unit}\n"
  end

  # This method reads values from the console, stores them in variables
  # and calls the make_a_table method.

  def get_table_arguments
    puts "Enter the starting value of the table."
    number = gets.chomp.to_f
    puts"Enter the step size of the table."
    step_size = gets.chomp.to_f
    puts "Enter the finishing value of the table."
    finish = gets.chomp.to_f
    puts "Enter the unit you wish to convert from."
    unit = gets.chomp
    unit = viability_check_unit(unit)
    puts "Enter the unit you wish to convert to."
    tar_unit = gets.chomp
    tar_unit = viability_check_unit(tar_unit)
    make_a_table(number, step_size, finish, unit, tar_unit)
  end

  # This method converts the input (number and unit) to the unit the users wishes to convert to (tar_unit)

  def converter(number, unit, tar_unit)
    from_meter = {"mm" => 1000.0, "cm" => 100.0, "m" => 1.0, "km" => 0.001, "inch" => 100/2.54, "mile" => 1/1609.344, "feet" => 3.28084}
    to_meter = {"mm" => 0.001, "cm" => 0.01, "m" => 1.0, "km" => 1000, "inch" => 0.254, "mile" => 1609.344, "feet" => 0.3048}
    ((number * to_meter[unit]) * from_meter[tar_unit]).round(5)
  end

  # This method creates a table by using the converter method
  # and the arguments from the get_table_arguments method.

  def make_a_table(number, step_size, finish, unit, tar_unit)
    current_value = number
    while current_value <= finish
      new_value = converter(current_value, unit, tar_unit)
      printf("%75.5g %s = %s %s \n", current_value, unit, new_value, tar_unit)
      current_value += step_size
    end
  end

  # This method checks rather a unit the user puts in is known to the program or not.
  # If not, a list of options is given and the user is asked to reenter the unit.

  def viability_check_unit (unit)
    units = %w(mm cm m km inch feet mile)
    while units.include?(unit) == false
      puts "unknown unit"
      puts "viable units: mm, cm, m, km, inch, feet, mile "
      puts "please reenter the unit:"
      unit = gets.chomp.downcase
    end
    return unit
  end
end
