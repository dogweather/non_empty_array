# typed: ignore
# frozen_string_literal: true

require 'spec_helper'

RSpec.describe NonEmptyArray do
  let(:has_one) { NonEmptyArray.new('x') }
  let(:has_three) { NonEmptyArray.new('x', %w[y z]) }

  it 'handles length of 1' do
    expect(has_one.count).to eq(1)
  end

  it 'handles length of 3' do
    expect(has_three.count).to eq(3)
  end

  it 'does last with length 1' do
    expect(has_one.last).to eq('x')
  end

  it 'does last with length 3' do
    expect(has_three.last).to eq('z')
  end

  it 'does last with false elements' do
    one_false = NonEmptyArray.new(123, [false])

    expect(one_false.to_a).to eq([123, false])
    expect(one_false.last).to eq(false)
  end

  it 'does last with nil elements' do
    one_nil = NonEmptyArray.new(123, [nil])

    expect(one_nil.to_a).to eq([123, nil])
    expect(one_nil.last).to eq(nil)
  end

  it 'does all_but_last with length 1' do
    expect(has_one.all_but_last).to eq([])
  end

  it 'does all_but_last with length 3' do
    expect(has_three.all_but_last).to eq(%w[x y])
  end

  it 'properly pushes' do
    has_one.push(99)
    expect(has_one.count).to eq(2)

    has_one.push('z')
    expect(has_one.count).to eq(3)
    expect(has_one.last).to eq('z')
    expect(has_one.all_but_last).to eq(['x', 99])
  end

  it 'does first with length 1' do
    expect(has_one.first).to eq('x')
  end

  it 'does tail with length 1' do
    expect(has_one.tail).to eq([])
  end
end
