require_relative 'person'

# create teacher class inheret from person class
class Teacher < Person
  def initialize(id, specialization, age, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
