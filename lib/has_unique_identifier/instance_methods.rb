module HasUniqueIdentifier
  module InstanceMethods
    DEFAULT_RANDOM_IDENTIFIER_LENGTH = 24
    DEFAULT_SAFE_CHARS = (
      ('A'..'Z').to_a +
      ('a'..'z').to_a +
      ('0'..'9').to_a +
      %w(- _ ~)
    ).freeze

    extend ActiveSupport::Concern

    def to_param
      if self.class.unique_identifier &&
        self.class.unique_identifier.options[:to_param] == true

        return send(self.class.unique_identifier.name)
      end
      super
    end

    included do
      before_validation :ensure_unique_identifier

      private

      def ensure_unique_identifier
        return unless self.class.unique_identifier
        return if self[self.class.unique_identifier.name].present?

        length = self.class.unique_identifier.options[:length] ||
          DEFAULT_RANDOM_IDENTIFIER_LENGTH

        unless self.class.unique_identifier.options[:force]
          return if self[self.class.unique_identifier.name].present?
        end
        send("#{self.class.unique_identifier.name}=",
          loop do
            chars =
              if self.class.unique_identifier.options[:safe_chars]
                self.class.unique_identifier.options[:safe_chars].dup
              elsif self.class.unique_identifier.options[:only_numbers]
                (0..9).to_a
              elsif self.class.unique_identifier.options[:only_letters]
                ('a'..'z').to_a + ('A'..'Z').to_a
              elsif self.class.unique_identifier.options[:no_symbols]
                ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
              else
                DEFAULT_SAFE_CHARS.dup
              end
            chars.shuffle!

            hash = Array.new(length) { chars.sample }.join
            unless self.class.exists?(self.class.unique_identifier.name => hash.to_s)
              break hash
            end
          end
        )
      end
    end
  end
end
