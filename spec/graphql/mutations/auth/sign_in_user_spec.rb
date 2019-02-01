# frozen_string_literal: true

require 'rails_helper'

describe Mutations::Auth::SignInUser do
  let(:mutation) { described_class.new(object: nil, context: nil) }
  let(:user) { create :user }

  describe '#resolve' do
    let(:password) { 'sample_password' }
    let(:email) { user.email }

    subject { mutation.resolve(email: email, password: password) }

    context 'with valid credentials' do
      it 'returns an access token' do
        expect(subject[:access_token]).to_not be_empty
      end
      it 'returns a uid' do
        expect(subject[:uid]).to eq(user.email)
      end
      it 'returns a client' do
        expect(subject[:uid]).to_not be_empty
      end
      it 'returns a expiry' do
        expect(subject[:expiry]).to_not be_empty
      end
      it 'returns a token type' do
        expect(subject[:token_type]).to_not be_empty
      end
      it 'returns a user' do
        expect(subject[:user]).to eq(user)
      end
    end

    context 'with invalid credentials' do
      let(:password) { 'pass' }

      it 'does not returns an access token' do
        expect(subject[:access_token]).to be_nil
      end
      it 'does not returns a uid' do
        expect(subject[:uid]).to be_nil
      end
      it 'does not returns a client' do
        expect(subject[:uid]).to be_nil
      end
      it 'does not returns a expiry' do
        expect(subject[:expiry]).to be_nil
      end
      it 'does not returns a token type' do
        expect(subject[:token_type]).to be_nil
      end
      it 'does not returns a user' do
        expect(subject[:user]).to be_nil
      end
    end
  end
end
