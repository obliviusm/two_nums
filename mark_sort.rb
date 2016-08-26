def mark_sort(array)
  array_max = array.max
  array_min = array.min
  markings = [0] * (array_max - array_min + 1)
  array.each do |a|
    markings[a - array_min] += 1
  end

  res = []
  markings.length.times do |i|
    markings[i].times do
      res << i + array_min;
    end
  end

  res
end
