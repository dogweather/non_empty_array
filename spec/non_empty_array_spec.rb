# typed: ignore
# frozen_string_literal: true

require 'spec_helper'

RSpec.describe NonEmptyArray do
  it 'does something useful' do
    expect(false).to eq(false)
  end

  it 'handles len of 1' do
    has_one = NonEmptyArray.new('x')
    expect(has_one.count).to eq(1)
  end
end
