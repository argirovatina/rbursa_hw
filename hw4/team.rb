require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team

  def initialize(&block)
    @all_developers = []
    instance_eval(&block)
  end

  def have_juniors(*names)
    names.each do |name|
      @all_developers << JuniorDeveloper.new(name)
    end
  end

  def have_developers(*names)
    names.each do |name|
      @all_developers.push(Developer.new(name))
    end
  end

  def have_seniors(*names)
    names.each do |name|
      @all_developers.push(SeniorDeveloper.new(name))
    end
  end

  def juniors
    @all_developers.select { |name| name.class == JuniorDeveloper }
  end

  def developers
    @all_developers.select { |name| name.class == Developer }
  end

  def seniors
    @all_developers.select { |name| name.class == SeniorDeveloper }
  end

  def team_all
    @all_developers
  end

  def priority(*params)
    #@priority = params
    @priority = params.each.zip([juniors, developers, seniors]).to_h

  end

  def add_task(task)
    @priority[:junior].map {|dev| dev.add_task(task)}
    # @priority.each do |p|
    #   a = send p
    #   a.each{|dev| dev.add_task(task) if dev.can_add_task?}
    # end
  end

  def on_task

  end

  def report
    @all_developers.map do |developer|
      str =  "#{developer.list}" unless developer.list.empty?
      str = "Нет задач!" if developer.list.empty?
      "'#{developer.developer}' ('#{developer.level}') : #{str} "
    end
  end
end

team = Team.new do
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"

  priority :juniors, :developers, :seniors

  on_task :junior do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  end

  on_task :developer do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, ушел работать!"
  end

  on_task :senior do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, но просит больше с такими глупостями не приставать!"
  end
end

#n = 10
puts team.priority(:junior)
#n.times{|times| team.add_task("Gjalksf #{times+1}")}
puts team.add_task '1'
puts team.add_task '2'
puts team.add_task '3'
puts team.add_task '4'
#puts team.report
puts team.on_task

