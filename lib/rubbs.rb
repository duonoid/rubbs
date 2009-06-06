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

  def post_init
    send_data "Hello.  Welcome to my world.\n"
  end

end

if $0 == __FILE__
  Rubbs.start '127.0.0.1', 1560
end
