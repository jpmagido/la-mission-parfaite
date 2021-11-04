# frozen_string_literal: true

module Search
  # works only with ::AdminReview model
  class AdminReview
    def self.filter_search(klass, attributes)
      attributes.to_unsafe_h.inject(klass) do |scope, (key, value)|
        formatted_value = value.to_s.upcase
        # return scope.scoped if value.blank?
        if value.blank?
          scope.all
        else
          case key.to_sym

          when :status
            scope.where(status: formatted_value)

          when :all
            scope.all

          else
            scope.all
          end
        end
      end
    end
  end
end