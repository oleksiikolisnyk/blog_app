# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true
    argument :blog_id, Integer, required: true
    argument :tag_ids, [Integer], required: false

    type Types::PostType

    def resolve(title: nil, body: nil, blog_id: nil, tag_ids: nil)
      tags = Tag.where(id: tag_ids)
      # current_user - works with FE
      # here  can we check user role
      # if current_user.writer?
        Post.create(
          user: current_user,
          blog_id: blog_id,
          title: title,
          body: body,
          tags: tags
        )
      # end
    end
  end
end
