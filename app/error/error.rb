module Error
  class RouteError < StandardError
  end

  def resolver
    yield
  rescue RouteError => _e
    html_content = File.read('./app/error_pages/404.html')
    # Redirect to 404 page
    [404, { 'Content-Type' => 'text/html' }, [html_content]]
  rescue StandardError => _e
    html_content = File.read('./app/error_pages/Error.html')
    # Redirect to 500 error page
    [500, { 'Content-Type' => 'text/html' }, [html_content]]
  end
end
