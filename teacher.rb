require './person'

# create teacher class inheret from person class
class Teacher < Person
  def initialize(specialization)
    super(28, 'shahzaman')
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
