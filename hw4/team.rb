require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team

  def initialize(&block)
    @all_developers = {}
    @on_work = {}
    instance_eval(&block)
  end

  def have_juniors(*names)
    @all_developers[:juniors] = names.map {|name| JuniorDeveloper.new(name)}
  end

  def have_developers(*names)
    @all_developers[:developers] = names.map {|name| Developer.new(name)}
  end

  def have_seniors(*names)
    @all_developers[:seniors] = names.map {|name| SeniorDeveloper.new(name)}
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
    @all_developers.values.flatten
  end

  def priority(*params)
    @priority = params
  end

  def add_task(task)
   available_dev = team_all.select{|dev| dev.can_add_task?}.sort_by{|dev| [@priority.index(dev.level), dev.list.count]}
   available_dev.first.add_task(task)
  end

  def on_task(level, &block)
    @on_work[level] = block if block_given?
  end

  def report
    team_all.map do |developer|
      str =  "#{developer.list}" unless developer.list.empty?
      str = "Нет задач!" if developer.list.empty?
      "'#{developer.developer}' ('#{developer.level}') : #{str} "
    end
  end
end

team = Team.new do
  have_juniors "Владислава", "Аркадий", "Рамеш"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_seniors "Олег", "Оксана"

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
# puts team.priority(:junior)
# #n.times{|times| team.add_task("Gjalksf #{times+1}")}
puts team.add_task '1'
 puts team.add_task '2'
 puts team.add_task '3'
 puts team.add_task '4'
# puts team.report
puts team.on_task(:junior)
