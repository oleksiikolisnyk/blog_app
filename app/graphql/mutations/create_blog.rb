# frozen_string_literal: true

module Mutations
  class CreateBlog < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false

    type Types::BlogType

    def resolve(title: nil, description: nil)
      # here  can we check user role and create error if he has not permissions
      # if current_user.writer?
        Blog.create(
          user: current_user,
          title: title,
          description: description
        )
      # end
    end
  end
end
