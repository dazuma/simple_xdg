# SimpleXDG

`SimpleXDG` is a no-frills Ruby class implementing the XDG Base Directory
Specification. This spech defines where certain user-specific application
files, such as configuration, cache, and saved state, should live on the user's
file system. It specifies environment variables that contain this information,
and defaults that should be used if those environment variables are unset. The
spec itself is at https://specifications.freedesktop.org/basedir/latest/

## Getting started

Install `SimpleXDG` via the
[simple_xdg gem](https://rubygems.org/gems/simple_xdg).

```sh
% gem install simple_xdg
```

or add it to your Gemfile:

```ruby
gem "simple_xdg"
```

To use the service, instantiate `SimpleXDG`, and call methods to obtain the
directory paths:

```ruby
require "simple_xdg"
xdg = SimpleXDG.new
my_config_file_path = xdg.lookup_config("my_app_config.toml")
```

## Contributing

Development is done in GitHub at https://github.com/dazuma/simple_xdg.

 *  To file issues: https://github.com/dazuma/simple_xdg/issues.
 *  For questions and discussion, please do not file an issue. Instead, use the
    discussions feature: https://github.com/dazuma/simple_xdg/discussions.
 *  Pull requests are welcome, but in general please open an issue first before
    contributing significant changes.

The library uses [toys](https://dazuma.github.io/toys) for testing and CI. To
run the test suite, `gem install toys` and then run `toys ci`. You can also run
unit tests, rubocop, and build tests independently.

## License

Copyright 2026 Daniel Azuma

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
