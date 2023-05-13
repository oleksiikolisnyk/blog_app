# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :role, Integer, null: false
    field :blog, [Types::BlogType]
    field :posts, [Types::PostType]
    field :posts_count, Integer

    def posts_count
      object.posts.count
    end
  end
end
