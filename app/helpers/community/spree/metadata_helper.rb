module Community::Spree::MetadataHelper
  def community_og_meta_data
    if object.is_a? Spree::Product
      # Use spree default metadata generator
      og_meta_data
    else
      og_meta = {}
      og_meta['og:image']               = image_url('octobot_small.png')

      og_meta['og:url']                 = canonical_href(current_store.url, nil)
      og_meta['og:type']                = 'website'
      og_meta['og:title']               = current_store.name
      og_meta['og:description']         = current_store.meta_description
      og_meta
    end
  end

  def community_og_meta_data_tags
    community_og_meta_data.map do |property, content|
      tag('meta', property: property, content: content) unless property.nil? || content.nil?
    end.join("\n")
  end
end
