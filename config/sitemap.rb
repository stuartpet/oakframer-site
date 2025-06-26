SitemapGenerator::Sitemap.default_host = "https://example.com"
SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'weekly'
  add about_path
  add privacy_path
  add new_contact_path
end
