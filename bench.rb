require 'socket'
require 'benchmark'

n = (ARGV[0] || 1).to_i

puts Benchmark::CAPTION
puts Benchmark.measure {
  n.times.map do
    Thread.new do
      server = TCPSocket.new('localhost', 8080)

      message_to = Time.now.to_s
      server.puts message_to

      message_from = server.gets
    end
  end.each(&:join)
}
