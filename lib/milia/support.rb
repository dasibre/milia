module Milia
  module Support

    # Validate the content and type of the given tenant_id. Currently
    # Integers and Strings (UUID) are supported.
    def self.valid_tenant_id?(tenant_id)
      uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
      return false if tenant_id.blank?
      return false if tenant_id.kind_of?(Integer) && tenant_id.zero?
      return false if !(tenant_id.kind_of?(Integer) || tenant_id.kind_of?(String))
      return false if (tenant_id.kind_of?(String) && uuid_regex.match?(tenant_id))
      true
    end

  end
end
