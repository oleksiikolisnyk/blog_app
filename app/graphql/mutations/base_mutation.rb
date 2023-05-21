module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def current_user
      # current_user = User.first uncomment this line and remove the next one for manual testing - until we get FE
      context[:current_user]
    end
  end
end
