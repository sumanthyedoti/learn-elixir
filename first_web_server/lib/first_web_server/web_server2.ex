defmodule FirstWebServer.WebServer2 do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Home")
  end
  get "/profile" do
    send_resp(conn, 200, "Profile")
  end
  get "/profile/:name" do
    send_resp(conn, 200, "#{name}'s Porfile")
  end

  match _ do
    send_resp(conn, 404, "404: Not Found")
  end
end
