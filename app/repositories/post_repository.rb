class PostRepository 
  def find!(post_id)
    Post.find(post_id)
  end

  def find(post_id)
    find!(post_id)
  rescue ActiveRecord::RecordNotFound
    puts "PostID not found: #{post_id}"
    
    Post.first
  end

  def custom_find(post_id)
    raise ArgumentError.new("Invalid argument for post_id: #{post_id}") if post_id.zero?

    find(post_id)
  end
end
