class InvalidContentError < StandardError; end

class Panel < ApplicationRecord
    include ActionView::Helpers::SanitizeHelper


    before_validation :set_content
    before_validation :sanitize_and_strip_content

    validates :content, presence: true, allow_nil: false
    before_save :content_word_check
    before_save :content_format
    before_save :content_nil_check
     
    private

        def sanitize_and_strip_content
        self.content = sanitize(content).strip
        end

        def set_content
            @content = self.content
        end

        def content_format
            raise InvalidContentError, "Please avoid Numreic values and Special characters!" unless @content.match?(/\A[a-zA-Z ]+\z/)
        end

        def content_word_check
            raise InvalidContentError, "Please enter exact three words!" unless @content.split.count == 3
        end

        def content_nil_check
            if @content.nil?
                raise InvalidContentError, "The Sentence is Missing?"
              end
        end
end
