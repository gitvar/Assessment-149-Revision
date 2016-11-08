# 5.times do |num|
#   puts num
# end

# Invoking the Integer#times method produces this output:
# 0
# 1
# 2
# 3
# 4
# => 5

# def times(num)
#   counter = 0
#   loop do
#     yield(counter)
#     counter += 1
#     break if counter == num
#   end
#   num
# end

def times(num)
  counter = 0
  while counter < num do # 'do' is optional here!
    yield(counter)
    counter += 1
  end
end

times(5) do |num|
  puts num
end
