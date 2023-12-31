require_relative 'decorator'

# create TrimmerDecorator class
class TrimmerDecorator < Decorator
  def correct_name
    super()
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end
