class WebServer < Reel::Server::HTTP
  include Celluloid::Internals::Logger

  def initialize host = '127.0.0.1', port = 3000
    super host, port, &method(:on_connection)
    info "web server ready listing on #{host} port #{port}"
  end

  def on_connection connection
    connection.each_request do |request|
      info "new request #{request.url}"
      route request
    end
  end

  def route request
    if request.url == "/"
      return render request, 'index.html'
    elsif view_exist? request.path
      return render request, request.path
    end

    info "404 Not Found: #{request.path}"
    request.respond :not_found, "Not found"
  end

  def render request, file
    request.respond :ok, view(file)
  end

  def view_exist? file
    File.exist? view_path(file)
  end

  def view file
    File.read view_path(file)
  end

  def view_path file
    File.join(__dir__, 'client', 'public', file)
  end

end
