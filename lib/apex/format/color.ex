defmodule Apex.Format.Color do
  def colorize(text, data, options \\ []) do
    cond do
      options[:color] == false -> text
      color = color(data)      -> escape(text, color)
      true                     -> text
    end
  end

  def escape(text, color) do
    IO.ANSI.format([color, text], true) |> IO.chardata_to_string
  end

  defp color(data) when is_binary(data),   do: [IO.ANSI.color(187), :normal]
  defp color(data) when is_tuple(data),    do: :blue
  defp color(true),                        do: [IO.ANSI.color(201), :normal]
  defp color(false),                       do: [IO.ANSI.color(198), :normal]
  defp color(nil),                         do: :red
  defp color(data) when is_atom(data),     do: [IO.ANSI.color(133), :normal]
  defp color(data) when is_float(data),    do: [IO.ANSI.color(81), :normal]
  defp color(data) when is_integer(data),  do: [IO.ANSI.color(81), :normal]
  defp color(data) when is_function(data), do: [IO.ANSI.color(162), :normal]
  defp color(data) when is_list(data),     do: :white
  defp color(data) when is_pid(data),      do: :yellow
  defp color(data) when is_port(data),     do: [:green, :bright]
  defp color({Range, _, _}),               do: :green
  defp color({HashSet, _, _}),             do: :white
  defp color({HashDict, _, _}),            do: :white
  defp color(_), do: nil
end
