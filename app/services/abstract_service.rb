require 'net/http'

class AbstractService

  def initialize(backend_client = BackendClient.new(domain, port))
    @backend_client = backend_client
  end

  def domain
    raise "There is no domain for AbstractService"
  end

  def port
    80
  end

  protected

  def get(uri_path, options=nil, &block)
    do_request(:get, uri_path, options, &block)
  end

  def post(uri_path, options, &block)
    do_request(:post, uri_path, options, &block)
  end

  def put(uri_path, options=nil, &block)
    do_request(:put, uri_path, options, &block)
  end

  def delete(uri_path, options=nil, &block)
    do_request(:delete, uri_path, options, &block)
  end

  private

  def do_request(method, uri_path, options=nil, &block)
    raise "uri_path must start with a '/'" unless uri_path.starts_with?("/")
    raise "Invalid characters '?' or '&' in the uri_path" unless uri_path.scan(/\?|\&/).empty?
    # TONY: do you have a good way of fixing this?
    # this is my current hack to not have to put an extra {} as a second
    # argument to various service specs
    if options.present?
      @backend_client.do_request(method, uri_path, options, &block)
    else
      @backend_client.do_request(method, uri_path, &block)
    end
  end
end
