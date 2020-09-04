# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'

#
# An array which is guaranteed never to be empty.
#
class NonEmptyArray
  include Enumerable
  extend T::Sig

  sig { params(first_element: T.untyped).void }
  def initialize(first_element)
    @head = first_element
    @tail = T.let([], T::Array[T.untyped])
  end

  sig { override.params(block: T.untyped).void }
  def each(&block)
    [@head].each(&block)
  end
end
