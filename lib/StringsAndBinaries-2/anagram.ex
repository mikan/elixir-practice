defmodule MyString2 do
  def anagram?(word1, word2), do: word1 -- word2 == '' and word2 -- word1 == ''
end

# true
IO.puts MyString2.anagram? 'abc', 'cba'
IO.puts MyString2.anagram? 'cba', 'abc'
IO.puts MyString2.anagram? 'canoe', 'ocean'

# false
IO.puts MyString2.anagram? 'abc', 'def'
IO.puts MyString2.anagram? 'def', 'abc'
IO.puts MyString2.anagram? 'dormitory', 'dirty room'
