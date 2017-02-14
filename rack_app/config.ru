require 'faker'
require 'figaro'
require 'thin'
require 'webrick'

Figaro::Application.new(path: 'config/application.yml',
                        environment: ENV['RACK_ENV']).load

response = "<h3>ENV: #{ENV['RACK_ENV']}</h3>
            <h3>LAUNCHED ON: #{ENV['server']}</h3>

            <p>Faker response:<br/>
              <b>#{Faker::Lorem.sentence}</b>
            </p>"

Rack::Server.start(
  :app => lambda do |e|
    [200, {'Content-Type' => 'text/html'}, [response]]
  end,
  :server => ENV['server']
)
