module PagesHelper
    def template_options
      templates_path = Rails.root.join('app', 'views', 'pages')
      Dir.entries(templates_path).select { |f| f.ends_with?('.html.erb') }.map { |f| [f.chomp('.html.erb'), f.chomp('.html.erb')] }
    end
  end
  