def increment(number)
  if block_given?
    yield(number)
  else
    number + 1
  end
end

# method invocation
increment(5) do |num|
  puts num
end
