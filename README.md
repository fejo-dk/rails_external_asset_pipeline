# Use Rails with an external asset pipeline [![Build Status](https://travis-ci.org/fejo-dk/rails_external_asset_pipeline.svg)](https://travis-ci.org/fejo-dk/rails_external_asset_pipeline)

Instead of using the built-in asset pipeline of Rails, some people want to use external asset pipelines – written in Node.js for example. This gem enables the required integration with Rails.

Why is an integration like that required? If your external asset pipeline modifies the names of the generated files depending on their content (for example by adding a hash of the file to the name), Rails will not be able to find the files on its own. You still want to be able to use the helpers you are used to like `stylesheet_link_tag` or `image_tag`, and they should put out the correct URL for the desired asset. This technique is referred to as *cache busting*.

So let's say you have a JavaScript file called `application.js` (for example in `app/assets/javascripts`) and your external asset pipeline generates a file called `application-03118e77692b637cfc0f55bb27fef087.js` (for example in `public/assets/javascripts`) from that file. When you use `stylesheet_link_tag 'application'`, you expect that the resulting HTML points to the file containing the hash in its filename. To do that, your pipeline needs to generate manifest files for each type of asset. In this case, it needs to generate a file called `javascript.json` in `public/assets/manifests`. The file should look like this:

```json
{
  "application.js": "/assets/javascripts/application-03118e77692b637cfc0f55bb27fef087.js"
}
```

And that's it. This gem will take care of the rest. The resulting HTML will look like this:

```html
<!-- ... -->
<script src="/assets/javascripts/application-03118e77692b637cfc0f55bb27fef087.js" data-turbolinks-track="reload"></script>
<!-- ... -->
```

The types supported by this gem are:

* `stylesheet`
* `javascript`
* `image`

You can find an example of using this gem in Rails 5 with an external Node.js pipeline [here](https://github.com/moonglum/rails-5-and-node-asset-pipeline).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_external_asset_pipeline'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install rails_external_asset_pipeline
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fejo-dk/rails_external_asset_pipeline. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

