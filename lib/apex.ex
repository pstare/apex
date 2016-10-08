defmodule Apex do
  @moduledoc "Elixir clone of the awesome_print gem"

  @doc """
    Pretty prints the supplied data and returns the original data.
  """
  def ap(data, options \\ []) do
    formatted = Apex.Format.format(data, options)
    IO.puts(formatted)
    # Don't actually return the data
  end

  def apr(data, options \\[]) do
    ap(data, options)
    data
  end

  def apn(data, options \\ []) do
    data
    |> ap(options |> Keyword.merge(numbers: false))
  end

  def aprn(data, options \\ []) do
    data
    |> apr(options |> Keyword.merge(numbers: false))
  end

end
