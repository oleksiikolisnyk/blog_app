# frozen_string_literal: true

module Mutations
  class CreateBlog < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false

    type Types::BlogType

    def resolve(title: nil, description: nil)
      # user = context[:current_user] - works with FE
      user = User.first
      # here  can we check user role
      # if user.writer?
        Blog.create(
          user: user,
          title: title,
          description: description
        )
      # end
    end
  end
end
