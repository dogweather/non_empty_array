# typed: ignore
# frozen_string_literal: true

require 'sorbet-runtime'

#
# An array which is guaranteed never to be empty.
#
class NonEmptyArray
  include Enumerable

  def initialize(first_element)
    @head = first_element
    @tail = T.let([], T::Array[T.untyped])
  end

  def each(&block)
    [@head].each(&block)
  end
end
