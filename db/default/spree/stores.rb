# Possibly already created by a migration.
unless Spree::Store.where(code: 'spree').exists?
  Spree::Store.new do |s|
    s.code              = 'OctoBot Community'
    s.name              = 'OctoBot Community'
    s.url               = ENV['HOST_DOMAIN'] || 'community.octobot.online'
    s.mail_from_address = 'drakkar-software@protonmail.com'
    s.meta_description  = "Simply customize and improve your OctoBot using the community extensions. Test and use new strategies, additional features and more."
    s.seo_title         = "OctoBot Community"
    s.meta_keywords     = "octobot community, octobot, community, trading, open source, community, cryptocurrency, cryptocurrencies, bitcoin, ethereum"
    s.default_currency  = 'USD'
    s.twitter           = "DrakkarsOctoBot"
  end.save!
end
