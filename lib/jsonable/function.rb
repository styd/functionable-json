# frozen_string_literal: true

require 'json' unless defined? ::JSON

module JSONable
  class Function < Numeric
    attr_reader :file_name, :line_number, :function

    def initialize(&block)
      @file_name, @line_number = block.source_location
    end

    def to_json(*)
      scrape_function!
      cleanup_function!
    end

    def scrape_function!
      @function = +'function'
      open_braces = 0

      catch(:function_ends) do
        File.foreach(file_name).with_index(1) do |line, index|
          next if index < line_number

          scanner = StringScanner.new(line)
          scanner.scan_until(/function/)
          while scanner.scan(/[^{}]+/)
            @function << scanner.matched
            while str = scanner.scan(/{|}/)
              @function << str
              case str
              when '{'
                open_braces += 1
              when '}'
                throw(:function_ends) if open_braces <= 1
                open_braces -= 1
              end
            end
          end
        end
      end
    end

    def cleanup_function!
      @function.tr("\n", '').squeeze(' ')
    end
  end
end
