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
    @all_developers[:juniors].select { |name| name.class == JuniorDeveloper }
  end

  def developers
    @all_developers[:developers].select { |name| name.class == Developer }
  end

  def seniors
    @all_developers[:seniors].select { |name| name.class == SeniorDeveloper }
  end

  def all
    @all_developers.values.flatten
  end

  def priority(*params)
    @priority = params
  end

  def add_task(task)
   @available_dev = all.select{|dev| dev.can_add_task?}.sort_by{|dev| [@priority.index(dev.level), dev.list.count]}
   fail ArgumentError if @available_dev.empty?
  rescue ArgumentError
    'Нет свободных разработчиков'
  else
   first_in_row = @available_dev.first
   first_in_row.add_task(task)
   @on_work[first_in_row.level.to_s.chop.to_sym].call(first_in_row, task)
  end

  def on_task(level, &block)
    @on_work[level] = block if block_given?
  end

  def report
    @available_dev.map do |developer|
      str =  "#{developer.list.join(', ')}" unless developer.list.empty?
      str = 'Нет задач!' if developer.list.empty?
      puts "#{developer.name} (#{developer.level.to_s.chop}) : #{str} "
    end
  end
end

team = Team.new do
  have_seniors 'Олег', 'Оксана'
  have_developers 'Олеся', 'Василий', 'Игорь-Богдан'
  have_juniors 'Владислава', 'Аркадий', 'Рамеш'

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