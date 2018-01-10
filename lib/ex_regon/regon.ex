defmodule ExRegon.Regon do
  @moduledoc false

  # wages for calculating REGON checksum
  @w9  [8, 9, 2, 3, 4, 5, 6, 7]
  @w14 [2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8]

  # validity of REGON
  @spec valid?(String.t()) :: boolean()
  def valid?(regon) when is_binary(regon), do: check?(to_list(regon))

  defp check?([_, _, _, _, _, _, _, _, _] = regon), do: checksum?(regon, @w9, 0)
  defp check?([x1, x2, x3, x4, x5, x6, x7, x8, x9, _, _, _, _, _] = regon) do
    checksum?([x1, x2, x3, x4, x5, x6, x7, x8, x9], @w9, 0)
    and checksum?(regon, @w14, 0)
  end
  defp check?(_), do: false

  defp checksum?([crc], [], acc),         do: crc == rem(rem(acc, 11), 10)
  defp checksum?([x | r], [w | rw], acc), do: checksum?(r, rw, x * w + acc)
  defp checksum?(_, _, _),                do: false

  # Transposing REGON to list of digits
  defp to_list(regon) do
    regon
    |> scan()
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp scan(regon), do: resolve(Regex.scan(~r/^\d{9,14}$/, regon))
  defp resolve([]),        do: ""
  defp resolve([[regon]]), do: regon
end
