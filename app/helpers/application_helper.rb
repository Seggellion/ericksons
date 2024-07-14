module ApplicationHelper

    def meta_title
        content_for?(:meta_title) ? content_for(:meta_title) : "Default Title"
      end
    
      def meta_description
        content_for?(:meta_description) ? content_for(:meta_description) : extract_description(@service.content) if defined?(@service)
      end
    
      def meta_keywords
        content_for?(:meta_keywords) ? content_for(:meta_keywords) : extract_keywords(@service.content) if defined?(@service)
      end

      private

      def extract_description(content)
        # Extract the first 160 characters from the content for the description
        strip_tags(content).truncate(160)
      end
    
      def extract_keywords(content)
        # Extract keywords from the content (simple implementation)
        keywords = strip_tags(content).split.uniq.take(10).join(", ")
        keywords.presence || "default, keywords, for, your, website"
      end

end
