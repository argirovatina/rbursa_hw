require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team

  attr_reader :juniors
  attr_reader :developers
  attr_reader :seniors


  def initialize(&block)
    instance_eval(&block)
  end

  def have_juniors(*names)
    @juniors = names
  end

  def have_developers(*names)
    @developers = names
  end

  def have_seniors(*names)
    @seniors = names
  end

  def priority(*params)
    all_developers =
        {
        params[0] => @juniors,
    params[1] => @developers,
    params[2] => @seniors
    }
  end

end

  team = Team.new do
    have_juniors "Владислава", "Аркадий", "Рамеш"
    have_developers "Олеся", "Василий", "Игорь-Богдан"
    have_seniors "Олег", "Оксана"
    priority :juniors, :developers, :seniors
end

p team.priority :juniors, :developers



