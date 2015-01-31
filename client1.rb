require 'socket'

n = (ARGV[0] || 1).to_i

n.times.map do
  Thread.new do
    server = TCPSocket.new('localhost', 8080)

    message_to = Time.now.to_s
    server.puts message_to

    message_from = server.gets
    puts message_from
  end
end.each(&:join)
