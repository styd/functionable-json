require 'spec_helper'

RSpec.describe Functionable::JSON do
  it 'has a version number' do
    expect(Functionable::JSON::VERSION).not_to be nil
  end

  it 'responds to function and val' do
    expect(Object.new).to respond_to(:function)
    expect(Object.new).to respond_to(:val)
  end
end
