class UserPreloadService
  USER_ID = 2.freeze
  POST_TITLE = 'Post title # 0'.freeze

  class << self
    def preload_posts!
      User.preload(:posts).find_by('users.id = ?', USER_ID)
    end

    def eager_load_posts!
      User.eager_load(:posts).where('users.id = ?', USER_ID)
    end

    def joins_posts!
      User.joins(:posts)
        .where('users.id = ? AND posts.title = ?', USER_ID, POST_TITLE)
    end

    def joins_posts_title!
      User.joins(:posts)
        .select('users.*, posts.title as post_title')
        .where('users.id = ? AND posts.title = ?', USER_ID, POST_TITLE)
    end

    def uniq_joins_posts!
      joins_posts!.uniq
    end

    def include_posts!
      User.includes(:posts)
        .where(users: { id: USER_ID },
               posts: { title: POST_TITLE})
    end

    def include_references_posts!
      User.includes(:posts)
        .references(:posts)
        .where('users.id = ? AND posts.title = ?', USER_ID, POST_TITLE)
    end
  end
end
