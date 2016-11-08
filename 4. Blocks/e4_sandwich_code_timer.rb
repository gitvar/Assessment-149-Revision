def time_it(delay)
  time_before = Time.now
  yield(delay) # execute the implicit block
  time_after= Time.now
  puts "It took #{format("%10f", (time_after - time_before))} seconds."
end

time_it(1) { |delay| sleep(delay) }
time_it(0) { "hello world" }
