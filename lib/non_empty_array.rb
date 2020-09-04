# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'

#
# An array which is guaranteed never to be empty.
#
class NonEmptyArray
  include Enumerable
  extend T::Sig

  sig { params(first_element: T.untyped, tail: T::Array[T.untyped]).void }
  def initialize(first_element, tail = [])
    @head = first_element
    @tail = tail
  end

  sig { override.params(block: T.untyped).void }
  def each(&block)
    ([@head] + @tail).each(&block)
  end
end
