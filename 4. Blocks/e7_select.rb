arr = (1..20).to_a

def select(array)
  index = 0
  new_array = []
  while index < array.size
    new_array << array[index] if yield(array[index])
    index += 1
  end
  new_array
end

my_array = select(arr) { |e| e.even? }
p my_array
