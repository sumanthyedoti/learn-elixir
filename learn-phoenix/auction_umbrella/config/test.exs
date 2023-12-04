import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :auction_web, AuctionWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "e60wFaGA9pR4iBVOcqxdk2NW+YPj/2aKzLcQIMNXRKy1TwL3HRXQnccC00645pCa",
  server: false
