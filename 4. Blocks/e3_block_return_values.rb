def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# method invocation
# compare('hello') { |word| word.upcase }
compare('hello') { |word| puts "hi" }
