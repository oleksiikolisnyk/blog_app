# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :blog, Types::UserType, null: false
    field :title, String
    field :body, String
    field :tags, [Types::TagType]
    field :comments, [Types::CommentType]
    field :posted_by, UserType, null: true, method: :user
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
