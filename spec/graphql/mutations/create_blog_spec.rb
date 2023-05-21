require 'rails_helper'

RSpec.describe Mutations::CreateUser do
  subject { BlogAppSchema.execute(mutation)['data']['createBlog'] }

  describe '#resolve' do
    let(:title) { 'Test blog itle' }
    let(:description) { 'Test blog description' }
    let(:current_user) { create(:user, role: 'writer') }
    let(:mutation) do
      <<~GRAPHQL
        mutation {
          createBlog(input: {
            title: "#{title}",
            description: "#{description}"
          }) {
              id
              title
            	description
          }
        }
      GRAPHQL
    end

    it 'creates a new user' do
      expect_any_instance_of(Mutations::BaseMutation).to receive(:current_user).and_return(current_user)

      is_expected.to be_a_kind_of(Hash)
      expect(subject.keys).to include('id', 'title', 'description')
      expect(subject.values).not_to include(nil)

      expect(Blog.find(subject['id']).title).to eq(title)
    end
  end
end
