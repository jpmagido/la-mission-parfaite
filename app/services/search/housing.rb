# frozen_string_literal: true

module Search
  # works only with ::CompanyScrapping model
  class Housing
    def self.filter_search(klass, attributes)
      attributes.to_unsafe_h.inject(klass) do |scope, (key, value)|
        formatted_value = value.to_s.upcase
        # return scope.scoped if value.blank?
        if value.blank?
          scope.all
        else
          case key.to_sym

          when :breakfast
            scope.where(breakfast: formatted_value)

          when :city
            scope.where(city: formatted_value)

          when :housing_type
            scope.where(housing_type: formatted_value)
            #scope.where("#{scope.table_name}.housing_type ILIKE ?", "%#{formatted_value}%")

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