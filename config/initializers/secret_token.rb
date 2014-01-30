# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
MoritakaDb::Application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || 'ada42b5d346a8ba20ad1ec669010b27367392a2809001522664f8601a148df7533f64026bd620dd893a33c4b1a087f7f40b1a1f6dac087c410d4da62cdf60bcc'
