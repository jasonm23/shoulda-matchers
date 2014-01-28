# shoulda-matchers [![Gem Version][fury-badge]][fury] [![Build Status][travis-badge]][travis]

[Official Documentation][rubydocs]

shoulda-matchers provides Test::Unit- and RSpec-compatible one-liners that test
common Rails functionality. These tests would otherwise be much longer, more
complex, and error-prone.

### ActiveModel Matchers

* **[allow_mass_assignment_of](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#allow_mass_assignment_of-instance_method)**
  tests usage of Rails 3's `attr_accessible` and `attr_protected` macros.
* **[allow_value](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#allow_value-instance_method)**
  tests usage of the `validates_format_of` validation.
* **[ensure_inclusion_of](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#ensure_inclusion_of-instance_method)**
  tests usage of `validates_inclusion_of`.
* **[ensure_exclusion_of](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#ensure_exclusion_of-instance_method)**
  tests usage of `validates_exclusion_of`.
* **[ensure_length_of](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#ensure_length_of-instance_method)**
  tests usage of `validates_length_of`.
* **[have_secure_password](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#have_secure_password-instance_method)**
  tests usage of `has_secure_password`.
* **[validate_confirmation_of](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#validate_confirmation_of-instance_method)**
  tests usage of `validates_confirmation_of`.
* **[validate_numericality_of](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#validate_numericality_of-instance_method)**
  tests usage of `validates_numericality_of`.
* **[validate_presence_of](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#validate_presence_of-instance_method)**
  tests usage of `validates_presence_of`.
* **[validate_uniqueness_of](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#validate_uniqueness_of-instance_method)**
  tests usage of `validates_uniqueness_of`.

### ActiveRecord Matchers

* **[accept_nested_attributes_for](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#accept_nested_attributes_for-instance_method)**
  tests usage of the `accepts_nested_attributes_for` macro.
* **[belong_to](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#belong_to-instance_method)**
  tests your `belongs_to` associations.
* **[have_many](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#have_many-instance_method)**
  tests your `has_many` associations.
* **[have_one](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#have_one-instance_method)**
  tests your `has_one` associations.
* **[have_and_belong_to_many](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#have_and_belong_to_many-instance_method)**
  tests your `has_and_belongs_to_many` associations.
* **[have_db_column](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#have_db_column-instance_method)**
  tests that the table that backs your model has a specific column.
* **[have_db_index](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#have_db_index-instance_method)**
  tests that the table that backs your model has an index on a specific column.
* **[have_readonly_attribute](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#have_readonly_attribute-instance_method)**
  tests usage of the `attr_readonly` macro.
* **[serialize](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#serialize-instance_method)**
  tests usage of the `serialize` macro.

### ActionController Matchers

* **[filter_param](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#filter_param-instance_method)**
  tests parameter filtering configuration.
* **[redirect_to](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#redirect_to-instance_method)**
  tests that an action redirects to a certain location.
* **[render_template](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#render_template-instance_method)**
  tests that an action renders a template.
* **[render_with_layout](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#render_with_layout-instance_method)**
  tests that an action is rendereed with a certain layout.
* **[rescue_from](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#rescue_from-instance_method)**
  tests usage of the `rescue_from` macro.
* **[respond_with](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#respond_with-instance_method)**
  tests that an action responds with a certain status code.
* **[route](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#route-instance_method)**
  tests your routes.
* **[set_session](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#set_session-instance_method)**
  makes assertions on the `session` hash.
* **[set_the_flash](http://rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda/Matchers/ActiveModel#set_the_flash-instance_method)**
  makes assertions on the `flash` hash.

## Installation

### RSpec

Include the gem in your Gemfile:

```ruby
group :test do
  gem 'shoulda-matchers'
end
```

### Test::Unit

shoulda-matchers was originally a component of
[Shoulda](http://github.com/thoughtbot/shoulda) -- it's what provides the nice
`should` syntax which is demonstrated below. For this reason, include it in
your Gemfile instead:

```ruby
group :test do
  gem 'shoulda'
end
```

### Non-Rails apps

Once it is loaded, shoulda-matchers automatically includes itself into your test
framework. It will mix in the appropriate matchers for ActiveRecord,
ActiveModel, and ActionController depending on the modules that are available at
runtime. For instance, in order to use the ActiveRecord matchers, ActiveRecord
must be available beforehand.

If your application is on Rails, everything should "just work", as
shoulda-matchers will most likely be declared after Rails in your Gemfile. If
your application is on another framework such as Sinatra or Padrino, you may
have a different setup, so you will want to ensure that you are requiring
shoulda-matchers after the components of Rails you are using. For instance,
if you wanted to use and test against ActiveModel, you'd say:

```ruby
gem 'activemodel'
gem 'shoulda-matchers'
```

and not:

```ruby
gem 'shoulda-matchers'
gem 'activemodel'
```

## Versioning

shoulda-matchers follows Semantic Versioning 2.0 as defined at
<http://semver.org>.

## Credits

shoulda-matchers is maintained and funded by [thoughtbot][community]. Thank you
to all the [contributors][contributors].

## License

shoulda-matchers is copyright © 2006-2014 thoughtbot, inc. It is free software,
and may be redistributed under the terms specified in the
[MIT-LICENSE](MIT-LICENSE) file.

[fury-badge]: https://badge.fury.io/rb/shoulda-matchers.png
[fury]: http://badge.fury.io/rb/shoulda-matchers
[travis-badge]: https://secure.travis-ci.org/thoughtbot/shoulda-matchers.png?branch=master
[travis]: http://travis-ci.org/thoughtbot/shoulda-matchers
[rubydocs]: http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/frames
[community]: http://thoughtbot.com/community
[contributors]: https://github.com/thoughtbot/shoulda-matchers/contributors
