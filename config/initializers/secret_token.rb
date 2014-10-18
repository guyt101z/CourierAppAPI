# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
<<<<<<< HEAD
APICourier::Application.config.secret_token = 'd557f1252c379ae5a04c7c1d458ddf3b8dc695c425fbc8a25fa61da5214b964b8d86033b1d53049869bb3bb79fecda7344cd8c8881e73063763e8fb5817807e4'
=======
APICourier::Application.config.secret_token = '38a75476bb1912cc6530d0d51fa8123ca2a9146d0ab2530b84f46508b7e6e0b08951435395f2a7d9c418480632f527db698d2dd83074c92599ceee4a0a525dd9'
>>>>>>> d87a931719b584b82b1d5481508b176137522c40
