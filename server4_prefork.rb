# Server 4: multi process (prefork), single thread, no io multiplexing
require 'socket'
require_relative 'handler'

$0 = "xyz(master)"
server = TCPServer.new(8080)
puts "Listening 0.0.0.0:8080... (PID: #{$$})"
pids = 4.times.map do
  fork do
    loop do
      client = server.accept
      $0 = "xyz(worker)"
      handle_connection(client)
    end
  end
end
puts "Workers: #{pids.join(', ')}"
Process.waitall
puts "Shutdown"
