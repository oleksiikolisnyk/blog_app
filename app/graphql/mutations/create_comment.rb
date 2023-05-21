# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    argument :post_id, Integer, required: false
    argument :body, String, required: true

    type Types::CommentType

    def resolve(post_id: nil, body: nil)
      # here  can we check user role and handler for errors
      # if current_user.reader?
        Comment.create(
          user: current_user,
          post_id: post_id,
          body: body
        )
      # end
    end
  end
end
