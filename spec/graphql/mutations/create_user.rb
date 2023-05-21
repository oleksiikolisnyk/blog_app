require 'rails_helper'

RSpec.describe Mutations::CreateUser do
  subject { BlogAppSchema.execute(mutation)['data']['createUser'] }

  describe '#resolve' do
    let(:name) { 'Bob' }
    let(:email) { 'bob@the.cat' }
    let(:password) { 'password123' }
    let(:mutation) do
      <<~GRAPHQL
        mutation {
          createUser(input: {
            name: "#{name}"
            authProvider: {
              credentials: {
                email: "#{email}"
                password: "#{password}"
              }
          	}
          }) {
            id
            name
            email
          }
        }
      GRAPHQL
    end

    it 'creates a new user' do
      is_expected.to be_a_kind_of(Hash)
      expect(subject.keys).to include('name', 'email')
      expect(subject.values).not_to include(nil)
    end
  end
end
