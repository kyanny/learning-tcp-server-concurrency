# Server 1: single process, single thread, no io multiplexing
require 'socket'
require_relative 'handler'

$0 = "xyz(master)"
server = TCPServer.new(8080)
puts "Listening 0.0.0.0:8080... (PID: #{$$})"
loop do
  client = server.accept
  handle_connection(client)
end
puts "Shutdown"
