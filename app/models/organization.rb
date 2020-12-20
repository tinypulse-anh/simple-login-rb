class Organization < ApplicationRecord
  has_one :saml_setting
  has_many :permissions

  scope :with_saml_sso, -> { joins(:saml_setting).where(saml_settings: { active: true }) }
end
