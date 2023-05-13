# frozen_string_literal: true

module Types
  class BlogType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :posts, [Types::PostType]
    field :user, Types::UserType, null: false
    field :user_id, Integer, null: false
  end
end
