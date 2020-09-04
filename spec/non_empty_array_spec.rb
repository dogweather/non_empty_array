# typed: ignore
# frozen_string_literal: true

require 'spec_helper'

RSpec.describe NonEmptyArray do
  it 'handles length of 1' do
    has_one = NonEmptyArray.new('x')
    expect(has_one.count).to eq(1)
  end

  it 'handles length of 2' do
    has_one = NonEmptyArray.new('x', ['y'])
    expect(has_one.count).to eq(2)
  end
end
