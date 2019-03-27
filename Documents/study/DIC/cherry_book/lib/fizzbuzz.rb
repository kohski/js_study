def fizz_buzz(n)
  if n % 15 == 0
    "FizzBuzz"
  elsif n % 5 == 0
    "Buzz"
  elsif n % 3 == 0
    "Fizz"
  else
    n.to_s
  end
end

# 100.times do |n|
#   fizz_buzz(n)
# end

