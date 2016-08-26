require_relative 'merge_sort'
require_relative 'radix_sort'
require_relative 'mark_sort'

def has_two_nums? c, x
  # x = NUMBERS.dup
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

numbers = []
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    numbers.push line.to_i
  end
end
numbers.radix_sort!
# NUMBERS = mergesort(NUMBERS)
# NUMBERS = mark_sort(NUMBERS)

# p NUMBERS
test_nums = [231552, 234756, 596873, 648219, 726312, 981237, 988331, 1277361, 1283379]
test_nums.each do |num|
  t1 = Time.now
  answer = has_two_nums? num, numbers.dup
  t2 = Time.now
  time = (t2 - t1) * 1000

  puts "#{num} - #{answer} - #{time.round(2)}ms"
end

=begin
radix sort
231552 - true - 4.82ms
234756 - false - 5.65ms
596873 - true - 4.67ms
648219 - true - 5.45ms
726312 - true - 4.68ms
981237 - false - 9.88ms
988331 - true - 4.87ms
1277361 - false - 9.28ms
1283379 - false - 9.07ms

merge sort
231552 - true - 4.58ms
234756 - false - 5.79ms
596873 - true - 5.09ms
648219 - true - 4.8ms
726312 - true - 4.59ms
981237 - false - 9.76ms
988331 - true - 4.73ms
1277361 - false - 9.03ms
1283379 - false - 9.14ms

mark sort
231552 - true - 4.67ms
234756 - false - 6.18ms
596873 - true - 5.43ms
648219 - true - 4.56ms
726312 - true - 4.66ms
981237 - false - 9.96ms
988331 - true - 4.89ms
1277361 - false - 9.28ms
1283379 - false - 8.89ms
=end
