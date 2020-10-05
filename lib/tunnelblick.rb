#!/usr/bin/env ruby

def osascript(script)
  system 'osascript', *script.split(/\n/).map { |line| ['-e', line] }.flatten
end

if ARGV.empty?
  puts "ERROR: missed command"
  exit
end

raise "env TUNNELBLICK_USER not set" if ENV['TUNNELBLICK_USER'].nil?
STATE = ARGV.shift
TUNNELBLICK_USER = ENV.fetch('TUNNELBLICK_USER') {''}
PROJECT = ARGV[0]

if STATE == "connect"
  osascript <<-END
tell application "Tunnelblick"
  connect "#{TUNNELBLICK_USER}-#{PROJECT}"
  get state of first configuration where name = "#{TUNNELBLICK_USER}-#{PROJECT}"
  repeat until result = "CONNECTED"
       delay 1
       get state of first configuration where name = "#{TUNNELBLICK_USER}-#{PROJECT}"
  end repeat
end tell
END
elsif STATE == "disconnect"
  osascript <<-END
tell application "Tunnelblick"
  disconnect "#{TUNNELBLICK_USER}-#{PROJECT}"
  get state of first configuration where name = "#{TUNNELBLICK_USER}-#{PROJECT}"
  repeat until result = "EXITING"
       delay 1
       get state of first configuration where name = "#{TUNNELBLICK_USER}-#{PROJECT}"
  end repeat
end tell
END
elsif STATE == "disconnect_all"
  osascript <<-END
tell application "Tunnelblick"
  disconnect all
end tell
END
else
  puts "Usage:./#{__FILE__} <connect/disconnect/disconnect_all> <project>"
end
