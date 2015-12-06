module HasUniqueIdentifier
  module ClassMethods
    def unique_identifier
      @unique_identifier
    end

    def has_unique_identifier(name, opts = {})
      raise ArgumentError if name.blank?

      @unique_identifier = OpenStruct.new(
        name: name,
        options: opts
      )
    end
  end
end
