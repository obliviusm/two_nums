# radix sort: https://rosettacode.org/wiki/Sorting_algorithms/Radix_sort#Ruby
class Array
  def radix_sort(base=10)
    ary = dup
    rounds = (Math.log(ary.minmax.map(&:abs).max)/Math.log(base)).floor + 1
    rounds.times do |i|
      buckets = Array.new(2*base){[]}
      base_i = base**i
      ary.each do |n|
        digit = (n/base_i) % base
        digit += base if 0<=n
        buckets[digit] << n
      end
      ary = buckets.flatten
      # p [i, ary] if $DEBUG
    end
    ary
  end
  def radix_sort!(base=10)
    replace radix_sort(base)
  end
end

def has_two_nums? c
  x = NUMBERS.dup
  x = x.delete_if {|n| n + x.first > c }

  i = 0
  j = x.length - 1

  while i != j do
    sum = x[i] + x[j]
    if sum < c
      i += 1
    elsif sum > c
      j -= 1
    else
      return true
    end
  end
  false
end

NUMBERS = []
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    NUMBERS.push line.to_i
  end
end
NUMBERS.radix_sort!

# p NUMBERS
test_nums = [231552, 234756, 596873, 648219, 726312, 981237, 988331, 1277361, 1283379]
test_nums.each do |num|
  puts "#{num} - #{has_two_nums? num}"
end
