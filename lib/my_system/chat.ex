defmodule MySystem.Chat do
  @moduledoc """
  Simple distributed chat demo for Elixir/Erlang.
  """

  @doc """
  Start the chat listener on this node.
  """
  def start do
    case Process.whereis(:chat) do
      nil ->
        pid = spawn(fn -> listen() end)
        Process.register(pid, :chat)
        IO.puts("✅ Chat started on #{Node.self()}")
        :ok
      _pid ->
        IO.puts("⚠️  Chat already running")
        :already_started
    end
  end

  @doc """
  Connect to another node.

  Example
  ```
  iex> Chat.connect(:node1)
  ```
  """
  def connect(node_name) do
    case Node.connect(node_name) do
      true -> IO.puts("✅ Connected to #{node_name}")
      false -> IO.puts("❌ Failed to connect to #{node_name}")
      :ignored -> IO.puts("ℹ️  Already connected to #{node_name}")
    end
  end

  @doc """
  Send a message to all connected nodes.
  """
  def broadcast(message) do
    nodes = Node.list()
    Enum.each(nodes, fn node ->
      send({:chat, node}, {Node.self(), message})
    end)
  end

  @doc """
  Send a message to a specific node.
  """
  def send_to(node_name, message) do
    send({:chat, node_name}, {Node.self(), message})
  end

  @doc """
  Show information about the cluster.
  """
  def info do
    IO.puts("\n🌐 Cluster Info")
    IO.puts("━━━━━━━━━━━━━━━━━━━━━━━━")
    IO.puts("This node: #{Node.self()}")
    IO.puts("Connected: #{inspect(Node.list())}")
    IO.puts("Total nodes: #{length(Node.list()) + 1}")
    IO.puts("━━━━━━━━━━━━━━━━━━━━━━━━\n")
  end

  # Private functions

  defp listen do
    receive do
      {from_node, message} ->
        IO.puts("\n💬 [#{from_node}]: #{message}")
        listen()
    end
  end
end
