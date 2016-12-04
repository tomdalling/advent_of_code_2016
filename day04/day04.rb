require 'byebug'
require 'set'
require_relative '../vec3'

ALPHA = 'abcdefghijklmnopqrstuvwxyz'.each_char.to_a

def decode(name, sector_id)
  name.split('-').map{ |word| rotate(word, sector_id) }.join(' ')
end

def rotate(word, sector_id)
  word.each_char.map do |ch|
    ALPHA[(ALPHA.index(ch) + sector_id) % ALPHA.size]
  end.join
rescue
  p ch
  raise
end

TEST_DATA = <<~EOS
  aaaaa-bbbbb-z-y-x-123[abxyz]
  a-b-c-d-e-f-g-h-987[abcde]
  not-a-real-room-404[oarel]
  totally-real-room-200[decoy]
EOS

REAL_DATA = File.read(File.join(File.dirname(__FILE__), 'data.txt'))

DATA = REAL_DATA

input_lines = DATA
  .lines
  .map(&:strip)
  .map do |l|
    name, _, tail = l.rpartition('-')
    sector_id, _, checksum = tail.partition('[').map{ |x| x.chomp(']') }
    [name, Integer(sector_id), checksum]
  end

sum = 0
input_lines.map! do |name, sector_id, checksum|
  my_checksum = name
    .split('-').join
    .each_char
    .group_by(&:itself)
    .map{ |ch, occurs| [ch, occurs.size] }
    .group_by(&:last)
    .to_a
    .sort_by(&:first)
    .reverse
    .map{ |(count, pairs)| [count, pairs.map(&:first).sort] }
    .map(&:last)
    .reduce([], :concat)
    .take(5)
    .join

  if my_checksum == checksum
    sum += sector_id
  end

  decoded_name = decode(name, sector_id)
  "#{sector_id}: #{decoded_name}"
end

puts input_lines
