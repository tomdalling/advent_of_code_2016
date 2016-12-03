require_relative '../vec3'

test_input = <<~EOS
EOS

real_input = File.read('day03/data.txt')

things = real_input
 .lines
 .map(&:strip)

tris = things.each_slice(3).flat_map do |(l1, l2, l3)|
  l1 = l1.split.map{ |i| Integer(i) }
  l2 = l2.split.map{ |i| Integer(i) }
  l3 = l3.split.map{ |i| Integer(i) }

  [
    [l1[0], l2[0], l3[0]],
    [l1[1], l2[1], l3[1]],
    [l1[2], l2[2], l3[2]],
  ]
end

correct = tris.select do |sides|
  (
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[2] + sides[0] > sides[1]
  )
end

p correct.size
