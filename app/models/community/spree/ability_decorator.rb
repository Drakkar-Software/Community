# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
module Community::Spree
  module AbilityDecorator
    def initialize(user)
      # add cancancan aliasing
      alias_action :delete, to: :destroy
      alias_action :create, :update, :destroy, to: :modify

      user ||= Spree.user_class.new

      if user.respond_to?(:has_spree_role?) && user.has_spree_role?('admin')
        can :manage, :all
      else
        can :read, ::Spree::Country
        can :read, ::Spree::OptionType
        can :read, ::Spree::OptionValue
        can :create, ::Spree::Order
        can :show, ::Spree::Order do |order, token|
          order.user == user || order.token && token == order.token
        end
        can :update, ::Spree::Order do |order, token|
          !order.completed? && (order.user == user || order.token && token == order.token)
        end
        can :manage, ::Spree::Address do |address|
          address.user == user
        end
        can :create, ::Spree::Address do |_address|
          user.id.present?
        end
        can :read, ::Spree::CreditCard, user_id: user.id
        can :read, ::Spree::Product
        can :read, ::Spree::ProductProperty
        can :read, ::Spree::Property
        can :create, Spree.user_class
        can %i[show update destroy], Spree.user_class, id: user.id
        can :read, ::Spree::State
        can :read, ::Spree::Taxon
        can :read, ::Spree::Taxonomy
        can :read, ::Spree::Variant
        can :read, ::Spree::Zone
        can :create, ::Spree::Review
        can :create, ::Spree::FeedbackReview

        if defined?(Spree::Credits)
          can :read, ::Spree::Microtransaction
          can :read, ::Spree::InventoryRelationship
          can %i[create read], ::Spree::CreditsPurchase
          can %i[create read], ::Spree::Donation
        end

        can %i[create read], ::Spree::BacktestingRun if defined?(Spree::Backtesting)
      end
    end
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
::Spree::Ability.prepend(Community::Spree::AbilityDecorator)
