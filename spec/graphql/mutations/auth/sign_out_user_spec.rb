# frozen_string_literal: true

require 'rails_helper'

describe Mutations::Auth::SignOutUser do
  let(:user) { create :user }
  let(:mutation) { described_class.new(object: nil, context: { current_user: user }) }

  describe '#resolve' do
    let!(:tokens) { user.create_new_auth_token }
    let(:uid) { user.email }
    let(:client) { user.tokens.first }

    subject { mutation.resolve(uid: uid, client: client[0]) }

    context 'with correct uid and client' do
      it 'returns success true' do
        expect(subject[:success]).to eq(true)
      end
    end

    context 'with incorrect uid and client' do
      let(:uid) { 'test' }
      it 'returns success false' do
        expect(subject[:success]).to eq(false)
      end
    end
  end
end
