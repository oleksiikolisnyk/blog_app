# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    argument :post_id, Integer, required: false
    argument :body, String, required: true

    type Types::CommentType

    def resolve(post_id: nil, body: nil)
      # user = context[:current_user] - works with FE
      user = User.first # hardcoded user, but with FE this line can be removed
      # here  can we check user role
      # if user.reader?
        Comment.create(
          user: user,
          post_id: post_id,
          body: body
        )
      # end
    end
  end
end
