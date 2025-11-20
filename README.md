# MySystem
Demo repo

## Steps for connecting node TOGETHER
1. Install MISE `brew install mise` and `mise activate`. We use this to manage erlang and elixir versions.
2. run `mise trust` and `mise install`
3. Get local ip `ipconfig getifaddr en0` and save it (we need it later)
4. run `mix deps.get`
5. run `iex --name <your_short_name>@<your_ip> --cookie demo -S mix`

Commands for connecting and sending messages
```elixir
iex> Chat.start()
iex> Node.self() # Here you can see your app name and host
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
