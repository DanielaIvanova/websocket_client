defmodule Client do
  use WebSockex

  require Logger

  def start_link() do
    WebSockex.start("ws://localhost:4001/websocket", __MODULE__, %{},
      name: __MODULE__,
      debug: [:trace]
    )
  end

  def subscribe(name) when is_atom(name) or is_binary(name) do
    request =
      case name do
        :keyblocks -> %{payload: "KeyBlocks", op: "Subscribe"}
        :microblocks -> %{payload: "MicroBlocks", op: "Subscribe"}
        :txs -> %{payload: "Transactions", op: "Subscribe"}
        key -> %{payload: "Object", op: "Subscribe", target: key}
      end

    WebSockex.send_frame(__MODULE__, {:text, Poison.encode!(request)})
  end

  def subscribe(name) do
    request = %{payload: name, op: "Subscribe"}
    WebSockex.send_frame(__MODULE__, {:text, Poison.encode!(request)})
  end

  def subscribe() do
    subscribe(:keyblocks)
    subscribe(:microblocks)
    subscribe(:txs)
  end

  def unsubscribe(name) when is_atom(name) or is_binary(name) do
    request =
      case name do
        :keyblocks -> %{payload: "KeyBlocks", op: "Unsubscribe"}
        :microblocks -> %{payload: "MicroBlocks", op: "Unsubscribe"}
        :txs -> %{payload: "Transactions", op: "Unsubscribe"}
        key -> %{payload: "Object", op: "Unsubscribe", target: key}
      end

    WebSockex.send_frame(__MODULE__, {:text, Poison.encode!(request)})
  end

  def unsubscribe(name) do
    request = %{payload: name, op: "Unsubscribe"}
    WebSockex.send_frame(__MODULE__, {:text, Poison.encode!(request)})
  end

  def unsubscribe() do
    unsubscribe(:keyblocks)
    unsubscribe(:microblocks)
    unsubscribe(:txs)
  end

  def handle_frame({:text, msg}, state) do
    Logger.debug(msg)
    {:ok, state}
  end
end
