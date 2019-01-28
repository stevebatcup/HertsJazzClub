module Admin
  class NewsletterSubscribersController < Admin::ApplicationController
    def valid_action?(name, resource = resource_class)
      %w[show].exclude?(name.to_s) && super
    end
  end
end
