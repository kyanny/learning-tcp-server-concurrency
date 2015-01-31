require 'time'

def handle_connection(client)
  if ENV['NO_SLEEP']
    handle_connection_nosleep(client)
  elsif ENV['IS_BENCH']
    handle_connection_bench(client)
  else
    handle_connection_default(client)
  end
end

def handle_connection_default(client)
  message_from = client.gets
  client_ts = Time.parse(message_from)
  server_ts = Time.now
  diff_ts = server_ts - client_ts
  sleep 1

  message_to = "Diff: #{diff_ts} (PID: #{$$})"
  client.puts message_to
  puts message_to

  client.close
end

def handle_connection_nosleep(client)
  message_from = client.gets
  client_ts = Time.parse(message_from)
  server_ts = Time.now
  diff_ts = server_ts - client_ts

  message_to = "Diff: #{diff_ts} (PID: #{$$})"
  client.puts message_to
  puts message_to

  client.close
end

def handle_connection_bench(client)
  message_from = client.gets
  client_ts = Time.parse(message_from)
  server_ts = Time.now
  diff_ts = server_ts - client_ts

  message_to = "Diff: #{diff_ts} (PID: #{$$})"
  client.puts message_to

  client.close
end
