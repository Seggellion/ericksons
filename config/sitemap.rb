# config/sitemap.rb
SitemapGenerator::Sitemap.create do
    Service.find_each do |service|
      add service_path(service), lastmod: service.updated_at
    end
  end
  