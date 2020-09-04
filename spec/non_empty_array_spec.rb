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

  it 'does all_but_last with length 1' do
    expect(has_one.all_but_last).to eq([])
  end

  it 'does all_but_last with length 3' do
    expect(has_three.all_but_last).to eq(%w[x y])
  end
end
