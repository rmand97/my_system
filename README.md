# MySystem
Demo repo

## Steps for connecting node TOGETHER
1. Install MISE `brew mise install` and `mise activate`
2. run `mise trust` and `mise install`
3. Get local ip `ipconfig getifaddr en0` and save it
4. run `mix deps.get`
5. run `iex --name <your_short_name>@<your_ip> --cookie demo -S mix`

Commands for connecting and sending messages
```elixir
iex> Chat.start()
iex> Node.self()
iex> Chat.connect(:"some-node@node-host")
iex> Chat.broadcast("Speak 'friend' and enter")
```

## Steps for Rolf
My test system to demo elixir and the BEAM

```
MIX_ENV=prod mix release
RELEASE_NODE=node1@localhost RELEASE_COOKIE=secret _build/prod/rel/my_system/bin/my_system start_iex
```

### Connect
`Node.connect(:node1@localhost)`

### Start listening and register the process
```elixir
pid = spawn(&MySystem.listen/0)
Process.register(pid, :demo)
```

### Send message
`send({:demo, node1}, "Hello from node2")`
