# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'

#
# An enumerable which is guaranteed to not be empty.
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
    _all.each(&block)
  end

  sig { returns(T.untyped) }
  def last
    @tail[-1] || @head
  end

  sig { returns(T::Array[T.untyped]) }
  def all_but_last
    T.must(_all.slice(0..-2))
  end

  sig { returns(T::Array[T.untyped])}
  attr_reader :tail

  sig { params(element: T.untyped).returns(NonEmptyArray) }
  def push(element)
    @tail.push(element)
    self
  end

  private

  sig { returns(T::Array[T.untyped]) }
  def _all
    [@head] + @tail
  end
end
