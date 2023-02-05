# This file is used by Rack-based servers to start the application.

# CORS do Sistema
# use Rack::Cors do
#   allow do
#     origins 'http://localhost:3000'
#     resource '/users/*',
#         methods: [:get, :post, :delete, :put, :patch, :options, :head],
#         headers: 'x-domain-token',
#         expose: ['Some-Custom-Response-Header'],
#         max_age: 600
#         # headers to expose
#   end
# end
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
