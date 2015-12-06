require 'rails/railtie'

module HasUniqueIdentifier
  class Railtie < Rails::Railtie

    initializer "has_unique_identifier.setup_orm" do |app|
      [:active_record, :sequel].each do |orm|
        ActiveSupport.on_load orm do
          HasUniqueIdentifier.setup_orm self
        end
      end
    end
  end
end
