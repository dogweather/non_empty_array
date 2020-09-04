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

  it 'does last with length 1' do
    has_one = NonEmptyArray.new('x')

    expect(has_one.last).to eq('x')
  end

  it 'does last with length 3' do
    has_three = NonEmptyArray.new('x', %w[y z])

    expect(has_three.last).to eq('z')
  end

  it 'does all_but_last with length 1' do
    has_one = NonEmptyArray.new('x')

    expect(has_one.all_but_last).to eq([])
  end

  it 'does all_but_last with length 3' do
    has_three = NonEmptyArray.new('x', %w[y z])

    expect(has_three.all_but_last).to eq(%w[x y])
  end
end
