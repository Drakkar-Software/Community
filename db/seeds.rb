# Official engine seeds
Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

# Drakkar-Software's engine seeds
SpreeCloud::Engine.load_seed if defined?(SpreeCloud)
SpreeDonations::Engine.load_seed if defined?(SpreeDonations)

# Create frontend mandatory taxonomies
Spree::Taxonomy.create([{ name: "Categories", store: Spree::Store.current },
                        { name: "Brands", store: Spree::Store.current }])
