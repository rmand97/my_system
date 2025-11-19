defmodule MySystem do
  @moduledoc """
  Documentation for `MySystem`.
  This is my only module.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MySystem.hello()
      :world

  """
  def hello do
    "Hello from hello function"
  end

  @doc """
  Here are some new docs
  """
  def listen do
    receive do
      msg ->
        IO.puts("📨 Received: #{inspect(msg)}")
        listen()
    end
  end
end
