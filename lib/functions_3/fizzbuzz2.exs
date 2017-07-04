fizzbuzz = fn
(0,0,_) -> "FizzBuzz"
(0,_,_) -> "Fizz"
(_,0,_) -> "Buzz"
(_,_,n) -> n
end
fizzbuzz2 = fn (n) -> fizzbuzz.(rem(n,3),rem(n,5),n) end
IO.puts(fizzbuzz2.(10)) # Buzz
IO.puts(fizzbuzz2.(11)) # 11
IO.puts(fizzbuzz2.(12)) # Fizz
IO.puts(fizzbuzz2.(13)) # 13
IO.puts(fizzbuzz2.(14)) # 14
IO.puts(fizzbuzz2.(15)) # FizzBuzz
IO.puts(fizzbuzz2.(16)) # 16
