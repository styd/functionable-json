[![Gem Version](https://img.shields.io/gem/v/functionable-json.svg?label=functionable-json)](https://rubygems.org/gems/functionable-json)
[![Build Status](https://travis-ci.org/styd/functionable-json.svg?branch=master)](https://travis-ci.org/styd/functionable-json)

According to [RFC8259](https://tools.ietf.org/html/rfc8259):

> JSON can represent four primitive types (`strings`, `numbers`, `booleans`,
> and `null`) and two structured types (`objects` and `arrays`).

Now, with this gem, you can have the 7th one, `function`.

So, basically, what I'm saying is the json is no longer conform with the
**RFC8259**. The resulting function is not guaranteed to be executable in 
JavaScript because it doesn't check what's inside the function. It also cannot
be parsed back into hash. So, use it at your own risk!


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'functionable-json'
```

And then execute:

    $ bundle


## Usage

```ruby
{
  speed: function(val) {
           return parseFloat(val).toLocaleString();
         }
}.to_json
#=> "{\"speed\":function(val) { return parseFloat(val).toLocaleString(); }}"
```

But, don't go wild just yet and try not to put multiple functions on the same
line.

If you try the above example on your REPL (e.g. `irb` or `pry`) it won't
work since the gem will try to find the file that stores the code. So, you
need to put it on a file and run it.

### How can a JavaScript function be called from Ruby?

Well, technically, it's not a JavaScript function. It's a Ruby method named
`function` that's available in any object. In JavaScript, a form like that is
a _function declaration_, but in Ruby it's a method invocation. So, in that case,
`val` needs to already exist before you call it, and it is. Both `function` and
`val` are already a method of an object. If you want to use arguments with
another name, you need to declare them as variable first.

```ruby
arg1, arg2 = nil
{
  equality: function(arg1, arg2) {
              return arg1 + ' == ' + arg2
            }
}.to_json
#=> "{\"equality\":function(arg1, arg2) { arg1 + ' == ' + arg2 }}"
```


## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
