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
