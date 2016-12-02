KEYPAD = {
  [0, 0] => 1,
  [1, 0] => 2,
  [2, 0] => 3,
  [0, 1] => 4,
  [1, 1] => 5,
  [2, 1] => 6,
  [0, 2] => 7,
  [1, 2] => 8,
  [2, 2] => 9,
}
KEYPAD2 = {
  [2,0] => 1,
  [1,1] => 2,
  [2,1] => 3,
  [3,1] => 4,
  [0,2] => 5,
  [1,2] => 6,
  [2,2] => 7,
  [3,2] => 8,
  [4,2] => 9,
  [1,3] => 'A',
  [2,3] => 'B',
  [3,3] => 'C',
  [2,4] => 'D',
}

loc = [0, 2]

File.read('data.txt').each_line do |line|
  line.strip.each_char do |ch|
    old_loc = loc.dup
    case ch
    when 'L' then loc[0] -= 1
    when 'R' then loc[0] += 1
    when 'U' then loc[1] -= 1
    when 'D' then loc[1] += 1
    end
    loc = old_loc unless KEYPAD2.has_key?(loc)
  end
  puts "Ending at #{loc.inspect}/#{KEYPAD2.fetch(loc)}"
end
