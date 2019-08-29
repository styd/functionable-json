require 'spec_helper'


RSpec.describe JSONable::Function do
  FUNCTION1 = function(val) {
    return '$' + parseFloat(val).toLocaleString()
  }

  arg = nil
  FUNCTION2 = function(arg) { return arg + 'km' }

  arg1, arg2 = nil
  FUNCTION3 = function(arg1, arg2) { return arg1 + arg2 }

  FUNCTION4 = function(val) {
    try {
      doSomething();
      return 1
    }
    catch(err) {
      return 0
    }
  }

  it 'is a kind of Numeric' do
    expect(FUNCTION1).to be_a Numeric
  end

  context '#to_json' do
    it 'returns function as json' do
      expect(FUNCTION1.to_json).to eq(
        "function(val) { return '$' + parseFloat(val).toLocaleString() }"
      )
      expect(FUNCTION2.to_json).to eq "function(arg) { return arg + 'km' }"
      expect(FUNCTION3.to_json).to eq "function(arg1, arg2) { return arg1 + arg2 }"
      expect(FUNCTION4.to_json).to eq(
        "function(val) { " \
          "try { doSomething(); return 1 } " \
          "catch(err) { return 0 } " \
        "}"
      )
      expect({a: FUNCTION2}.to_json).to eq "{\"a\":function(arg) { return arg + 'km' }}"
    end
  end
end
