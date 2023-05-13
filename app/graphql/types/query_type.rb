module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :blog, Types::BlogType, null: false do
      argument :id, ID, required: true
    end

    def blog(id:)
      Blog.find(id)
    end

    field :posts, [Types::PostType], null: false do
      argument :page, Integer, required: false
      argument :limit, Integer, required: false
      argument :title, String, required: false
      argument :user_id, Integer, required: false
      argument :blog_id, Integer, required: false
      argument :tag, String, required: false
    end

    def posts(page: nil, limit: 10, title: nil, user_id: nil, blog_id: nil, tag: nil)
      # here we can add validation which user can read posts, like by role
      Post.search({ title: title, user_id: user_id, blog_id: blog_id, tag: tag })
          .page(page)
          .per(limit)
    end

    field :post, Types::PostType, null: false do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    field :comments, [Types::CommentType], null: false do
      argument :page, Integer, required: false
      argument :limit, Integer, required: false
      argument :post_id, Integer, required: false
    end

    def comments(page: nil, limit: 10, post_id: nil)
      Comment.search({post_id: post_id})
          .page(page)
          .per(limit)
    end
  end
end
