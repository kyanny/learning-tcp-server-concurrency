# Server 3: single process, multi thread, no io multiplexing
require 'socket'
require_relative 'handler'

$0 = "xyz(master)"
server = TCPServer.new(8080)
puts "Listening 0.0.0.0:8080... (PID: #{$$})"
loop do
  client = server.accept
  Thread.new(client) do |client|
    handle_connection(client)
  end
end
puts "Shutdown"
