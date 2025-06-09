# Spree Omnibus

This is a Omnibus extension for [Spree Commerce](https://spreecommerce.org), an open source e-commerce platform built with Ruby on Rails.

## Installation

1. Add this extension to your Gemfile with this line:

    ```ruby
    bundle add spree_omnibus
    ```

2. Run the install generator

    ```ruby
    bundle exec rails g spree_omnibus:install
    ```

3. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Developing

1. Create a dummy app - make sure you have installed node ( npm install esbuild; npm init -y)

    ```bash
    bundle update
    bundle exec rake test_app
    ```

2. Add your new code
3. Run tests

    ```bash
    bundle exec rspec
    ```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_omnibus/factories'
```

## Releasing a new version

```shell
bundle exec gem bump -p -t
bundle exec gem release
```

Copyright (c) 2025 tomaszStrzeszewski23, released under the New BSD License
