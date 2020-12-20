class User < ApplicationRecord
  has_many :permissions

  def organizations
    Organization.joins(:permissions).where(permissions: { user_id: id, deactivated_at: nil })
  end

  def saml_sso_organizations
    organizations.with_saml_sso.distinct
  end

  def use_sso?
    saml_sso_organizations.exists?
  end
end
