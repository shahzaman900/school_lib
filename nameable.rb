# rubocop:disable Style/Documentation
class Nameable
  def correct_name
    raise NotImplementedError, 'method should be implemented'
  end
end

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = super
    return name[0, 10] if name.length > 10

    name
  end
end
