module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials: nil)
      return unless credentials

      user = User.find_by email: credentials[:email]

      return unless user
      return unless user.authenticate(credentials[:password])

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      # The functionality below works, but we need hardcoded token because wie do nnot have an FE
      # token = crypt.encrypt_and_sign("user-id:#{ user.id }")
      token = "pMDek/K4pgzxy3yhmYIRxRRl4Mk=--8JMxFOtX2Hf6B0ur--9LKKtaORVFaYnZtJUvnDHQ=="

      context[:session][:token] = token

      { user: user, token: token }
    end
  end
end
