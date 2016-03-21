module HasUniqueIdentifier
  module ClassMethods
    def unique_identifier
      return @unique_identifier if @unique_identifier
      if superclass.respond_to?(:unique_identifier)
        return superclass.unique_identifier
      end
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
