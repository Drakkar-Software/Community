require 'spec_helper'

describe Spree::Promotion::Actions::GiveStoreCredit, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:store) { Spree::Store.default }
  let(:promotion) { create(:promotion) }
  let(:action) { Spree::Promotion::Actions::GiveStoreCredit.create }
  let(:payload) { { user: user, store: store } }

  # From promotion spec:
  context '#perform' do
    before do
      promotion.promotion_actions << action
    end

    it 'increases user credits' do
      expect(user.total_available_store_credit).to eq(0)
      expect(action.perform(payload)).to be true
      expect(user.total_available_store_credit).to eq(1000)
    end
  end
end
