# Authors:: Lennart Draeger, Lars Jaeckel
require 'bigdecimal'
class Converter

  # This method reads values from the console, stores them in variables
  # and calls the converter method within a printf function to print out the result.
  def specific_unit_output(number, unit, tar_unit)
    unit = viability_check_unit(unit)
    tar_unit = viability_check_unit(tar_unit)
    printf "#{number}#{unit} = #{(converter(number, unit, tar_unit))} #{tar_unit}\n"
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
    unit = viability_check_unit(unit)
    tar_unit = viability_check_unit(tar_unit)
    current_value = number
    printf("%25s in %s\n", unit, tar_unit)
    while current_value <= finish
      new_value = converter(current_value, unit, tar_unit)
      printf("%25.5g => %s \n", current_value, new_value)
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
