class BackendClient
  def initialize(domain, port=nil)
    @http = Net::HTTP.new(domain, port)
  end

  def do_request(method, uri_path, options=nil, &block)
    method_type = method.to_s

    ignored_codes = (options.present? && options.delete(:ignore_codes)) || []

    if %w(get).include?(method_type) && options.present?
      uri_path << "?" + options.map {|k,v| "#{k}=#{v}"}.join("&")
    end

    request = "Net::HTTP::#{method_type.capitalize}".constantize.new(uri_path)

    if %w(post).include?(method_type)
      request.set_form_data(options)
    end

    resp = @http.request(request)
    resp_code = resp.code.to_i

    if resp_code != 200 && !ignored_codes.include?(resp_code)
      raise "WTF non 200...how do we want to deal w/ this?"
    end

    result = JSON.parse(resp.body)
    result && block_given? ? yield(result) : result
  end
end
