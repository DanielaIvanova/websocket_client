# Websocket Client

```
git clone https://github.com/DanielaIvanova/websocket_client
cd websocket_client && mix deps.get && iex -S mix
```

### Start websocket client
```elixir
Client.start_link()
```
### Subscribe

- `KeyBlocks`, `MicroBlocks`, `Transactions`
```elixir
Client.subscribe()
```

or you can subscribe:
```elixir
Client.subscribe(:keyblocks)
```
```elixir
Client.subscribe(:microblocks)
```
```elixir
Client.subscribe(:txs)
```

### Unsubscribe 
- `KeyBlocks`
```elixir
Client.unsubscribe(:keyblocks)
```

- `MicroBlocks`
```elixir
Client.unsubscribe(:microblocks)
```

- `Transactions`
```elixir
Client.unsubscribe(:txs)
```



