module HasUniqueIdentifier
  module InstanceMethods
    DEFAULT_RANDOM_IDENTIFIER_LENGTH = 24

    extend ActiveSupport::Concern

    def to_param
      if self.class.unique_identifier &&
        self.class.unique_identifier.options[:to_param] == true

        return send(self.class.unique_identifier.name)
      end
      super
    end

    included do
      before_create :ensure_unique_identifier

      private

      def ensure_unique_identifier
        return unless self.class.unique_identifier
        return if self[self.class.unique_identifier.name].present?

        length = self.class.unique_identifier.options[:length] ||
          DEFAULT_RANDOM_IDENTIFIER_LENGTH

        send("#{self.class.unique_identifier.name}=",
          loop do
            hash =
              if self.class.unique_identifier.options[:only_numbers]
                number_size = 10 ** length
                SecureRandom.random_number(9 * number_size) + number_size
              else
                SecureRandom.hex(length)
              end
            break hash unless self.class.exists?(self.class.unique_identifier.name => hash)
          end
        )
      end
    end
  end
end
