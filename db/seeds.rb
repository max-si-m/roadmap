puts 'Generating data'

db_config = Rails.configuration.database_configuration[Rails.env]
puts %x(go run db/db_seeds.go --db #{db_config['database']} --password #{db_config['password']})
