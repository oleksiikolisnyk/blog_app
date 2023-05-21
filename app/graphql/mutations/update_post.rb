# frozen_string_literal: true

module Mutations
  class UpdatePost < BaseMutation
    argument :id, Integer, required: true
    argument :title, String, required: true
    argument :body, String, required: true
    argument :tag_ids, [Integer], required: false
    argument :comment_body, String, required: false

    field :post, Types::PostType
    field :errors, [String]

    def resolve(id:, title:, body:, tag_ids:, comment_body:)
      post = Post.find(id)
      if post.user.id == current_user.id
        tags = Tag.where(id: tag_ids)
        comment = Comment.create(post: post, user: current_user, body: comment_body)

        post.comments << comment if !comment.nil?
        post.tags << tags if !tags.nil?
        if post.update(title: title, body: body)
          {
            post: post,
            errors: []
          }
        else
          {
            post: post,
            errors: post.errors.full_messages
          }
        end
      end
    end
  end
end
