# inspired from https://github.com/spree-contrib/spree_store_credits/pull/65
module Spree
  class Promotion
    module Actions
      class GiveStoreCredit < PromotionAction
        preference :amount, :decimal, default: 1000
        preference :category_name, :string, default: 'Promotion credits'

        def perform(payload = {})
          user = payload[:user]
          store = payload[:store]
          give_store_credit(store, user) if user.present?
        end

        def give_store_credit(store, user)
          user.store_credits.create!(
            amount: preferred_amount,
            created_by: user,
            action_originator: user,
            category: Spree::StoreCreditCategory.find_or_create_by!(name: preferred_category_name),
            store: store,
            currency: store.default_currency
          )
        end
      end
    end
  end
end
