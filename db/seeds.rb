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


# Drakkar-Software's engine seeds
SpreeCloud::Engine.load_seed if defined?(SpreeCloud)
SpreeDonations::Engine.load_seed if defined?(SpreeDonations)
