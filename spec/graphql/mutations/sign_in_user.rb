require 'rails_helper'

RSpec.describe Mutations::SignInUser do
  subject { BlogAppSchema.execute(mutation)['data']['signinUser'] }

  describe '#resolve' do
    let(:password) { 'password123' }
    let!(:user) { create(:user, password: password) }
    let(:mutation) do
      <<~GRAPHQL
        mutation {
          signinUser(
            input: {
              credentials: {
                email: "#{user.email}",
                password: "#{password}"
              }
          }) {
            token
            user {
            	id
          	}
          }
        }
      GRAPHQL
    end

    it 'reeturnees a token for the user' do
      is_expected.to be_a_kind_of(Hash)
      expect(subject.keys).to include('token')
      expect(subject.values).not_to include(nil)
    end
  end
end
