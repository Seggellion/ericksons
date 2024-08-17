module ApplicationHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : @service&.title || @page&.title || Setting.get('site-title') || "Default Title"
  end
  
  def canonical_url
    request.original_url
 end  

  def meta_description
    if content_for?(:meta_description)
      content_for(:meta_description)
    else
      @service&.meta_description || @page&.meta_description || extract_description(@service&.content || @page&.content) || Setting.get('website-description')
    end
  end      

  def unread_messages_count
    ContactMessage.unread_count
  end

  def favicon_url
    favicon = Setting.get('favicon')
    favicon&.attached? ? url_for(favicon) : asset_path('favicon.ico')
  end

  def twitter_card
    "summary_large_image" # Default to summary with a large image
  end

  def twitter_title
    og_title
  end

  def twitter_description
    og_description
  end

  def twitter_image
    og_image
  end

  def og_type
    if defined?(@article)
      "article"
    elsif defined?(@product)
      "product"
    else
      "website"
    end
  end

  def og_url
    request.original_url
  end

  def og_image    
    if content_for?(:og_image)
      content_for(:og_image)
    else      
      seo_image = url_for(Setting.get('seo-image'))      
      @service&.images&.first&.url || @page&.images&.first&.url || seo_image
    end
  end

  def og_description
    meta_description
  end

  def og_title
    meta_title
  end

  def meta_keywords
    if content_for?(:meta_keywords)
      content_for(:meta_keywords)
    else
      @page&.meta_keywords ||  @service&.meta_keywords || extract_keywords(@service&.content || @page&.content) || Setting.get('default-keywords')
    end
  end
      
  private

  def extract_description(content)
    content.to_plain_text.truncate(160) if content.present?
  end

  def extract_keywords(content)
    return "" unless content.present?
    # Extract keywords from the content (simple implementation)
    keywords = strip_tags(content).split.uniq.take(10).join(", ")
    keywords.presence || "default, keywords, for, your, website"
  end

  def page_url(page)
    "/#{page.slug}"
  end
end
