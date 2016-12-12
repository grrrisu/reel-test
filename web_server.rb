class WebServer < Reel::Server::HTTP

  def initialize host = '127.0.0.1', port = 3000
    super host, port, &method(:on_connection)
  end

  def on_connection connection
    connection.each_request do |request|
      Celluloid.logger.info "new request #{request}"
      request.respond :ok, "hello, world!"
    end
  end

end
