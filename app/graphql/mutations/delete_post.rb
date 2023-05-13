# frozen_string_literal: true

module Mutations
  class DeletePost < BaseMutation
    argument :id, Integer, required: true

    field :success, Boolean
    field :errors, [String]

    def resolve(id:)
      post = Post.find(id)
      if post.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
