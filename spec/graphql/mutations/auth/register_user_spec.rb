# frozen_string_literal: true

require 'rails_helper'

describe Mutations::Auth::RegisterUser do
  let(:mutation) { described_class.new(object: nil, context: nil) }

  describe '#resolve' do
    let(:password) { 'sample_password' }
    let(:password_confirmation) { 'sample_password' }
    let(:email) { 'guy@gmail.com' }
    let(:name) { 'Test Testerson' }
    let(:team_name) { 'Test' }

    subject do
      mutation.resolve(
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        name: name,
        teams_attributes: { 
          name: team_name
        }
      ) 
    end

    context 'with valid registration information' do
      it 'returns an access token' do
        expect(subject[:access_token]).to_not be_empty
      end
      it 'returns a uid' do
        expect(subject[:uid]).to eq(email)
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
        expect(subject[:user]).to eq(User.first)
      end
    end

    context 'with invalid registration information' do
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

    context 'with different password confirmation' do
      let(:password_confirmation) { 'pass' }

      it 'returns an error message' do
        expect(subject[:errors]).to eq(["Password confirmation doesn't match Password"])
      end
    end

    context 'with invalid email' do
      let(:email) { 'pass' }

      it 'returns an error message' do
        expect(subject[:errors]).to eq(["Email is not an email"])
      end
    end
  end
end
