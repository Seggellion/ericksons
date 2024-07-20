module ApplicationHelper

    def meta_title
        content_for?(:meta_title) ? content_for(:meta_title) : "Default Title"
      end
    
      def meta_description
        if content_for?(:meta_description)
          content_for(:meta_description)
        elsif defined?(@service) && @service.meta_description.present?
          @service.meta_description
        elsif defined?(@page) && @page.meta_description.present?
          @page.meta_description
        else
          extract_description(@service&.content || @page&.content)
        end
      end
    
      private
    
   
    
      def meta_keywords
        content_for?(:meta_keywords) ? content_for(:meta_keywords) : extract_keywords(@service.content) if defined?(@service)
      end
      
      def page_url(page)
        "/#{page.slug}"
      end

      private

      def extract_description(content)
        # Assuming extract_description logic here
        content.to_plain_text.truncate(160) if content.present?
      end

    
      def extract_keywords(content)
        # Extract keywords from the content (simple implementation)
        keywords = strip_tags(content).split.uniq.take(10).join(", ")
        keywords.presence || "default, keywords, for, your, website"
      end

end
