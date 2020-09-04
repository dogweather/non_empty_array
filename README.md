# NonEmptyArray

An enumerable which is guaranteed to not be empty.

Additionally, two methods which give access:

* `last()`
* `all_but_last()`

And one method for mutating the list:

* `push()`

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
a = NonEmptyArray.new()  # Ruby error - missing parameter
```

```ruby
a = NonEmptyArray.new(100)
a.count()              # => 1    All methods from [Enumerable](https://ruby-doc.org/core-2.7.1/Enumerable.html)

a.last()               # => 100
a.all_but_last() = []  # A normal array, which may indeed be empty.
```
