# frozen_string_literal: true

require_relative './nameable'

# create TrimmerDecorator class
class TrimmerDecorator < Decorator
  def correct_name
    name = super
    return name[0, 10] if name.length > 10

    name
  end
end
