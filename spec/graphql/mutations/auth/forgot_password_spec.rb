# frozen_string_literal: true

require 'rails_helper'

describe Mutations::Auth::ForgotPassword do
  before { ActionMailer::Base.deliveries = [] }
  let(:user) { create :user }
  let(:mutation) { described_class.new(object: nil, context: nil) }
  
  describe '#resolve' do
    let(:email) { user.email }

    subject { mutation.resolve(email: email) }

    context 'with correct email' do
      it 'returns success true and sends out email' do
        expect(subject[:success]).to eq(true)

        mail = ActionMailer::Base.deliveries.last
        expect(mail['from'].to_s).to eq('no-reply@whatidid.app')
        expect(mail['to'].to_s).to eq(user.email)
      end
    end

    context 'with incorrect email' do
      let(:email) { 'test' }
      it 'returns success false and does not send email' do
        expect(subject[:success]).to eq(false)
        mail = ActionMailer::Base.deliveries.count
        expect(mail).to eq(0)
      end
    end
  end
end
