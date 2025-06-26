class Rack::Attack
  # Allow all local traffic
  safelist("allow-localhost") do |req|
    "127.0.0.1" == req.ip || "::1" == req.ip
  end

  # Throttle POSTs to /contacts by IP address
  throttle("contacts/ip", limit: 5, period: 60) do |req|
    if req.path == "/contacts" && req.post?
      req.ip
    end
  end

  self.throttled_responder = ->(env) {
    [ 429, { "Content-Type" => "text/plain" },
      [ "Too many submissions. Please wait and try again." ] ]
  }
end
