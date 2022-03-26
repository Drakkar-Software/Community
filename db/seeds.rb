# Official engine seeds
Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

# TODO replace deprecated Spree::Store.current
current_store = Spree::Store.current

# Create frontend mandatory taxonomies
Spree::Taxonomy.create([{ name: "Categories", store: current_store },
                        { name: "Brands", store: current_store }])

# Create tentacle product taxon
taxonomy = Spree::Taxonomy.find_by!(name: "Categories", store: current_store)
Spree::Taxon.find_or_create_by!(name: "Tentacle", taxonomy: taxonomy, parent: taxonomy.root)

# Set current store currency
store_currency = "OBT"
current_store.default_currency = store_currency
current_store.supported_currencies_list << store_currency
current_store.save!

# Create default payment method
if Spree::PaymentMethod::StoreCredit.available.first.nil?
  credits_payment_method = Spree::PaymentMethod::StoreCredit.new(name: 'Store credits',
                                                                 description: 'Store credits',
                                                                 active: true,
                                                                 auto_capture: true,
                                                                 display_on: :both)
  credits_payment_method.stores << current_store
  credits_payment_method.save!
end

# Drakkar-Software's engine seeds
SpreeCloud::Engine.load_seed if defined?(SpreeCloud)
SpreeDonations::Engine.load_seed if defined?(SpreeDonations)
