class FakeBackendClient

  def initialize(domain = nil, port = nil)
    @domain = domain
    @port = port
  end

  def do_request(uri_path, options=nil, &block)
    file_path = construct_file_path(uri_path)

    unless File.exist?(file_path)
      raise "File #{file_path} doesn't exist, did you forget to stub fake data?"
    end

    json_str = nil

    File.open(file_path) { |file| json_str = file.read }

    result = JSON.parse(json_str)
    result && block_given? ? yield(result) : result
  end

  def construct_file_path(uri)
    if uri.start_with?("/")
      uri.slice!(0)
    end
    file_path = uri.gsub("/", "_").gsub(/_[\d]+/, "_id")
    file_path = "#{RAILS_ROOT}/lib/fixtures/#{@domain.downcase.gsub("-", "_")}/#{file_path}.json"
  end
end
