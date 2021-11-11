# frozen_string_literal: true

module TranslationsHelper
  def enum_french_translation(enum:, model_name: '', attribut: '')
    Hash[enum.map { |k,v| [I18n.t("activerecord.attributes.#{model_name.downcase}.#{attribut}.#{k}"), v] }]
  end

  def enum_french_for_edit(enum:, model_name: '', attribut: '')
    Hash[enum.map { |k,v| [I18n.t("activerecord.attributes.#{model_name.downcase}.#{attribut}.#{k}"), k] }]
  end
end
