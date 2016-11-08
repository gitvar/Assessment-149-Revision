def echo_with_yield(str)
  yield if block_given?
  str
end

puts echo_with_yield("Hello!") # No error if using 'if block_given?'

# puts echo_with_yield { puts "world" }
# => ArgumentError: wrong number of arguments (0 for 1) # 

puts echo_with_yield("hello!") { puts "world" } # world and return "hello!"

# puts echo_with_yield("hello", "world!") { puts "world" }
# => ArgumentError: wrong number of arguments (2 for 1)
