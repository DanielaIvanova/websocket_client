# Websocket Client

## Usage

```
git clone https://github.com/DanielaIvanova/websocket_client
cd websocket_client && mix deps.get && iex -S mix
```

### Start websocket client
```elixir
Client.start_link()
```
### Subscribe

- to all subscriptions - `KeyBlocks`, `MicroBlocks`, `Transactions`
```elixir
Client.subscribe()
```

or you can subscribe to specific one:
```elixir
Client.subscribe(:keyblocks)
```
```elixir
Client.subscribe(:microblocks)
```
```elixir
Client.subscribe(:txs)
```
- subscribe to an aeternity object
```elixir
Client.subscribe("ak_KHfXhF2J6VBt3sUgFygdbpEkWi6AKBkr9jNKUCHbpwwagzHUs")
```


### Unsubscribe 
- to all subscriptions - `KeyBlocks`, `MicroBlocks`, `Transactions`
```elixir
Client.unsubscribe()
```
or you can unsubscribe to specific one:
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

- unsubscribe to the object
```elixir
Client.unsubscribe("ak_KHfXhF2J6VBt3sUgFygdbpEkWi6AKBkr9jNKUCHbpwwagzHUs")
```
