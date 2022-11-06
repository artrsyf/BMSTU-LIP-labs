# frozen_string_literal: true

# class for finding and writing similar part of two files
class InTextFinder
  def find_similar(string1, string2)
    final_string = ''
    return 'Strings have nothing in common' if string1[0] != string2[0]

    (0..[string1, string2].min_by(&:length).length - 1).each do |index|
      string1[index] == string2[index] ? final_string += string1[index] : break
    end
    final_string
  end

  def write_in_file
    first_input_file = File.open('F.txt', 'r')
    second_input_file = File.open('G.txt', 'r')
    output_file = File.open('H.txt', 'w')
    output_file.write(find_similar(first_input_file.read, second_input_file.read))
    first_input_file.close
    second_input_file.close
    output_file.close
  end
end
