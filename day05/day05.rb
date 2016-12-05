require 'digest/md5'
require 'byebug'
require 'set'
require_relative '../vec3'

TEST_DATA = 'abc'
REAL_DATA = 'ugkcyxxp'

DATA = REAL_DATA

i = 0
password = [nil] * 8

ZERO_ORD = '0'.ord
SEVEN_ORD = '7'.ord

loop do
  hash = Digest::MD5.hexdigest("#{DATA}#{i}")
  if hash.start_with?('00000')
    posord = hash[5].ord
      if  posord >= ZERO_ORD && posord <= SEVEN_ORD
      pos = posord - ZERO_ORD
      if password[pos].nil?
        password[pos] = hash[6]
        puts "Found: #{password.inspect}"
        break unless password.any?(&:nil?)
      end
    end
  end
  i += 1
end


puts "Done: #{password.join}"
