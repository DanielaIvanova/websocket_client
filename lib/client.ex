defmodule Client do
  use WebSockex

  require Logger

  def start_link() do
    WebSockex.start("ws://localhost:4001/websocket", __MODULE__, %{},
      name: __MODULE__,
      debug: [:trace]
    )
  end

  def subscribe(atom) do
    request =
    case atom do
      :keyblocks -> %{payload: "KeyBlocks", op: "Subscribe"}
      :microblocks -> %{payload: "MicroBlocks", op: "Subscribe"}
      :txs -> %{payload: "Transactions", op: "Subscribe"}
      r -> r
    end
    WebSockex.send_frame(__MODULE__, {:text, Poison.encode!(request)})
  end

  def subscribe() do
    subscribe(:keyblocks)
    subscribe(:microblocks)
    subscribe(:txs)
  end

  def unsubscribe(atom) do
    request =
    case atom do
      :keyblocks -> %{payload: "KeyBlocks", op: "Unsubscribe"}
      :microblocks -> %{payload: "MicroBlocks", op: "Unsubscribe"}
      :txs -> %{payload: "Transactions", op: "Unsubscribe"}
      _ -> %{}
    end
    WebSockex.send_frame(__MODULE__, {:text, Poison.encode!(request)})
  end

  def handle_frame({:text, msg}, state) do
    Logger.debug(msg)
    {:ok, state}
  end
end
