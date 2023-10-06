require_relative './nameable'

# create CapitalizeDecorator class
class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.capitalize
  end
end
