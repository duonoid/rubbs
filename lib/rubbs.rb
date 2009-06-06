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

end