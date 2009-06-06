require 'rubygems'
require 'eventmachine'

class Rubbs < EventMachine::Protocols::LineAndTextProtocol

  # Initiates a TCP socket acceptor on the specified IP address and port.
  #
  # ==== Parameters
  # ip<String>:: IP address. Required.
  # port<Integer>:: Port number. Required.
  #
  def self.start(ip, port)
    EM.run {
      EM.start_server ip, port, self
    }
  end

  # Outputs banner when connection is established.
  #
  # TODO: a super-cool ASCII Art banner (read from external file)
  # TODO: would also be nice to throttle the text output (300, 1200, 2400bps)
  #
  def post_init
    send_data "Hello.  Welcome to my world.\n"
  end

end

if $0 == __FILE__
  # to run:
  #   $ ruby lib/rubbs.rb
  #
  # then:
  #   $ telnet 127.0.0.1 1560
  #
  Rubbs.start '127.0.0.1', 1560
end
