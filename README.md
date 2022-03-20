[![Build Status](https://travis-ci.com/dogweather/non_empty_array.svg?branch=master)](https://travis-ci.com/dogweather/non_empty_array)
 [![Gem Version](https://badge.fury.io/rb/non_empty_array.svg)](https://badge.fury.io/rb/non_empty_array)
# NonEmptyArray

An [enumerable](https://ruby-doc.org/core-2.7.1/Enumerable.html) which is guaranteed to have at least one element. E.g., `#first`
will never fail.

These four methods give non-empty-aware access:

### Always succeeds

* `#first`
* `#last`

### May return an empty Array

* `#tail`
* `#all_but_last`

And one method for mutating the list:

* `#push`

## Why is this useful?

Sometimes I know that an Array isn't empty. Or more accurately, it _shouldn't_ be empty, because
otherwise, it means there's a bug in my code. The usual way to handle this is
to repeatedly check the array's length, or check for nil, and throw an exception if, for some
reason, the Array _is_ empty. We've all been there.

**The `NonEmptyArray` approach saves this work by moving the non-emptyness
into the type system**, letting Ruby check and prevent misuse. I.e., this class is
designed so that it's impossible for it to be empty. It has [made illegal states unrepresentable](https://oleb.net/blog/2018/03/making-illegal-states-unrepresentable/).

And it has accessors like `#first` and `#last` which always return an element - they can never fail.
While Ruby isn't statically typed, the interpreter does check arity (the number of arguments provided).
So we enlist the interpreter's help to ensure a `NonEmptyArray` is always created with at least one
element:

```ruby
require 'non_empty_array'

a = NonEmptyArray.new()  # => Ruby error - missing parameter
```

```ruby
require 'non_empty_array'

a = NonEmptyArray.new('1000')  # Simplest way to create one
a.count()       # => 1
a.first()       # => '1000'
a.push('2000')
a.count()       # => 2
```

```ruby
require 'non_empty_array'

a = NonEmptyArray.new(100, [200, 300]).  # Can also create from a head and tail

# Methods from Enumerable
a.count()         # => 3
a.max()           # => 300
a.to_a()          # => [100, 200, 300]

# Methods specific to NonEmptyArray
a.first()         # => 100          Always succeeds - never returns a "no element" error.
a.last()          # => 300          Always succeeds
a.all_but_last()  # => [100, 200]   A normal array, which may indeed be empty.
a.push('400')
a.all_but_last()  # => [100, 200, 300]
a.tail()          # => [200, 300, 400]
```

Inspired by [Haskell's NonEmpty List](https://hackage.haskell.org/package/base-4.14.0.0/docs/Data-List-NonEmpty.html).
