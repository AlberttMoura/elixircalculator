defmodule Calculator do
  use Application

  def start(_type, _args) do
    n =
      IO.gets("How many prime numbers do you want? ")
      |> String.trim()
      |> String.to_integer()

    find_prime_numbers(n)
    {:ok, self()}
  end

  def find_prime_numbers(n, i \\ 2) do
    cond do
      n === 0 ->
        :ok

      is_prime(i) ->
        IO.inspect(i)
        find_prime_numbers(n - 1, i + 1)

      true ->
        find_prime_numbers(n, i + 1)
    end
  end

  def is_prime(n, i \\ 2) do
    cond do
      i > n / 2 -> true
      rem(n, i) === 0 -> false
      true -> is_prime(n, i + 1)
    end
  end
end
