# frozen_string_literal: true

def find_similar(string1, string2)
  final_string = ''
  puts 'Strings have nothing in common' if string1[0] != string2[0]
  (0..[string1, string2].min_by(&:length).length - 1).each do |index|
    string1[index] == string2[index] ? final_string += string1[index] : break
  end
  final_string
end

def write_in_file
  File.open('H.txt', 'w').write(find_similar(File.open('F.txt', 'r').read, File.open('G.txt', 'r').read))
end

write_in_file
