# config/sitemap.rb
SitemapGenerator::Sitemap.create do
    add root_path, priority: 1.0, changefreq: 'daily'
    Service.find_each do |service|
      add service_path(service), lastmod: service.updated_at
    end

    Page.find_each do |page|
      add page_path(page.slug), lastmod: page.updated_at
    end
  end
  