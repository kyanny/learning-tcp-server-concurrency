# Server 2: multi process (fork), single thread, no io multiplexing
require 'socket'
require_relative 'handler'

$0 = "xyz(master)"
server = TCPServer.new(8080)
puts "Listening 0.0.0.0:8080... (PID: #{$$})"
loop do
  client = server.accept
  fork do
    $0 = "xyz(worker)"
    handle_connection(client)
  end
end
Process.waitall
puts "Shutdown"
