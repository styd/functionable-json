# frozen_string_literal: true

require_relative '../jsonable/function'

module Functionable
  module JSON
    def function(*args, &block)
      JSONable::Function.new(&block)
    end

    def val; end
  end
end

Object.include(Functionable::JSON)
