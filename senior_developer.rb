require_relative 'developer'

class SeniorDeveloper < Developer
  MAX_TASKS = 15
  @level = :seniors

  def work!
    ["work", "relax"].sample == "work" ? (super; super) : ("Что-то лень")
  end
end