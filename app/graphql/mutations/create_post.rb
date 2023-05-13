# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true
    argument :tag_ids, [Integer], required: false

    type Types::PostType

    def resolve(title: nil, body: nil, tag_ids: nil)
      tags = Tag.where(id: tag_ids)

      # user = context[:current_user] - works with FE
      user = User.first
      # here  can we check user role
      # if user.writer?
        Post.create(
          user: user,
          title: title,
          body: body,
          tags: tags
        )
      # end
    end
  end
end
