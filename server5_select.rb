# Server 5: single process, single thread, io multiplexing (select)
require 'socket'
require_relative 'handler'

# $0 = "xyz(master)"
# server = TCPServer.new(8080)
# puts "Listening 0.0.0.0:8080... (PID: #{$$})"
# loop do
#   client = server.accept

#   handle_connection(client)
# end
# puts "Shutdown"
