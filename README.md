[![Gem Version](https://badge.fury.io/rb/non_empty_array.svg)](https://badge.fury.io/rb/non_empty_array) [![Build Status](https://travis-ci.com/dogweather/non_empty_array.svg?branch=master)](https://travis-ci.com/dogweather/non_empty_array)

# NonEmptyArray

An [enumerable](https://ruby-doc.org/core-2.7.1/Enumerable.html) which is guaranteed to not be empty. E.g., `#first`
will never fail.

These four methods give non-empty-aware access:

* `#first` — Always succeeds
* `#last`  — Always succeeds
* `#tail`         — May be an empty Array
* `#all_but_last` — May be an empty Array

And one method for mutating the list:

* `#push`

## Why is this useful?

Sometimes I know that an Array isn't empty. In fact, it should never be empty, because
otherwise, it means the object was set up incorrectly. The usual way to handle this is
to check the array's length, or check for nil, and throw an exception if, for some
reason, the Array _is_ empty.

This `NonEmptyArray` approach saves this unnecessary work by moving the non-emptyness
into the type system, letting Ruby check and prevent misuse. I.e., this class is
designed so that it's impossible for it to be empty. And it has accessors like `#last`
which always returns an element - it can never fail:

```ruby
require 'non_empty_array'

a = NonEmptyArray.new()  # => Ruby error - missing parameter
```

```ruby
require 'non_empty_array'

a = NonEmptyArray.new(100, [200, 300])

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

Influenced by [Haskell's NonEmpty List](https://hackage.haskell.org/package/base-4.14.0.0/docs/Data-List-NonEmpty.html).
