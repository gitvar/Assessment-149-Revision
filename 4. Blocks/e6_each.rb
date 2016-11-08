# test:
# arr = (1..5).to_a
# p arr
#
# my_array = arr.each { |e| puts e }
# puts
# p my_array
#
# Output:
# 1
# 2
# 3
# 4
# 5
#
# [1, 2, 3, 4, 5]


arr = (1..5).to_a

def each(array)
  index = 0
  while index < array.size
    yield(array[index])
    index += 1
  end
  array
end

my_array = each(arr) { |e| puts e }
p my_array
