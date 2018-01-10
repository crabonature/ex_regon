defmodule ExRegon do
  @moduledoc """
  Library for REGON number.

  * `ExRegon.valid?/1` - you can check if REGON number is valid

  More about REGON number:
  * [Wikipedia PL](https://pl.wikipedia.org/wiki/REGON)
  """

  alias ExRegon.Regon

  @doc """
  Is REGON number valid?

  REGON is valid when:
    * length of it is 9 digits
    * and last digit is proper checksum for first eight digits
    * or
    * length of it is 14 digits
    * and last digit is proper checksum for first thirteen digits
    * and nine digit is proper checksum for first eight digits (coz 0 in mask)

  For example:
      iex> ExRegon.valid?("390170518")
      true

      iex> ExRegon.valid?("859222088")
      false

      iex> ExRegon.valid?("39017051841250")
      true

      iex> ExRegon.valid?("39016051841250")
      false

      iex> ExRegon.valid?("123")
      false

      iex> ExRegon.valid?("1223233321212121212121212")
      false

      iex> ExRegon.valid?("some really bad data")
      false
  """
  @spec valid?(String.t()) :: boolean()
  defdelegate valid?(regon), to: Regon
end
