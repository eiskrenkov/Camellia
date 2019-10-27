# frozen_string_literal: true

Devise.setup do |config|
  # Load and configure the ORM
  require 'devise/orm/active_record'

  # Configure which authentication keys should be case-insensitive.
  # These keys will be downcased upon creating or modifying a user and when used to authenticate or find a user
  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  # These keys will have whitespace before and after removed upon creating or modifying a user and when used
  # to authenticate or find a user
  config.strip_whitespace_keys = [:email]

  # By default Devise will store the user in session. You can skip storage for particular strategies
  # by setting this option.
  config.skip_session_storage = [:http_auth]

  # Limiting the stretches to just one in testing will increase the performance of your test suite dramatically.
  # However, it is STRONGLY RECOMMENDED to not use a value less than 10 in other environments
  config.stretches = Rails.env.test? ? 1 : 11

  # Invalidates all the remember me tokens when the user signs out
  config.expire_all_remember_me_on_sign_out = true

  # Range for password length
  config.password_length = 6..128

  # Email regex used to validate email formats. It simply asserts that one (and only one) @ exists in the given string
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # Time interval you can reset your password with a reset password key
  config.reset_password_within = 6.hours

  # The default HTTP method used to sign out a resource
  config.sign_out_via = :delete
end
