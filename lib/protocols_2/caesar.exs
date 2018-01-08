defprotocol Caesar2 do
  def encrypt(string, shift)
  def rot13(string)
end

defimpl Caesar2, for: BitString do
  def encrypt(string, shift), do: to_string(caesar(to_charlist(string), shift))
  def rot13(string), do: encrypt(string, 13)
  defp caesar([], _), do: []
  defp caesar([head | tail], y), do: [loop(head, y) | caesar(tail, y)]
  defp loop(x, y), do: rem(((x - 97) + y), 26) + 97
end

defmodule Protocols2 do
  def run do
    words = File.read!("lib/protocols_2/2of12.txt")
            |> String.split
    words
    |> Enum.filter(&(Enum.member?(words, Caesar2.rot13(&1))))
  end
end

Protocols2.run
|> Enum.each(&(IO.puts "#{&1} -> #{Caesar2.rot13(&1)}"))

# Output:
# a -> n
# abjurer -> nowhere
# ah -> nu
# aha -> nun
# ant -> nag
# b -> o
# balk -> onyx
# bar -> one
# be -> or
# bin -> ova
# bub -> oho
# c -> p
# crag -> pent
# d -> q
# e -> r
# envy -> rail
# f -> s
# flap -> sync
# fur -> she
# g -> t
# gel -> try
# gnat -> tang
# h -> u
# i -> v
# irk -> vex
# j -> w
# k -> x
# l -> y
# m -> z
# n -> a
# nag -> ant
# nowhere -> abjurer
# nu -> ah
# nun -> aha
# o -> b
# oho -> bub
# one -> bar
# onyx -> balk
# or -> be
# ova -> bin
# p -> c
# pent -> crag
# q -> d
# r -> e
# rail -> envy
# s -> f
# she -> fur
# sync -> flap
# t -> g
# tang -> gnat
# try -> gel
# u -> h
# v -> i
# vex -> irk
# w -> j
# x -> k
# y -> l
# z -> m
