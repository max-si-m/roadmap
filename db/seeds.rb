puts 'Generating data'

# db_config = Rails.configuration.database_configuration[Rails.env]
# puts %x(go run db/db_seeds.go --db #{db_config['database']} --password #{db_config['password']})

100.times do |n|
  User.create(
    email: FFaker::Internet.free_email,
    name: FFaker::Name.name)
end
puts 'Users generated'

1000.times do |n|
  Post.create(
    title: "Post title # #{n}",
    body: FFaker::Tweet.body,
    user_id: rand(1...100))
end
puts 'Posts generated'

1000.times do |n|
  Comment.create(
    title: "Comment # #{n}",
    body: FFaker::Tweet.body,
    user_id: rand(1...100),
    post_id: rand(1...100))
end
puts 'Comments generated'
