# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    crypted_body = Digest::SHA256.hexdigest(body.join)

    case status
    when 200
      [status, headers, ["#{body.join}\n#{crypted_body}"]]
    else
      [status, headers, body]
    end
    # END
  end
end
