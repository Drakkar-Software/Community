require 'spec_helper'

describe Spree::Promotion::Actions::GiveStoreCredit, type: :model do
  let(:user) { create(:user) }
  let(:store) { Spree::Store.default }
  let(:promotion) { create(:promotion) }
  let(:action) { described_class.create }
  let(:payload) { { user: user, store: store } }

  # From promotion spec:
  describe '#perform' do
    before do
      promotion.promotion_actions << action
    end

    it 'increases user credits' do
      expect(user.total_available_store_credit).to eq(1000)
    end

    it 'returns true' do
      expect(action.perform(payload)).to be true
    end
  end
end
