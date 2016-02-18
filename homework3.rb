class Developer
  @@list = []
  MAX_TASKS = 10

  def max_tasks
    self.class::MAX_TASKS
  end

  def initialize(developer)
    @developer = developer
  end

  def add_task(task)
    @@list << task
    if @@list.length <= max_tasks
      puts "#{@developer}: добавлена задача #{task}. Всего в списке задач: #{@@list.length}"
    else
      puts "Слишком много работы!"
    end
  end

  def tasks
    @@list.each_with_index.each { |key, value| return "#{value+1}. #{key}" }
  end

  def work!
    begin
      if @@list.length > 0
        puts "#{@developer}: выполнена задача #{@@list.shift}. Осталось задач: #{@@list.length}"
      else
        raise ArgumentError, "Нечего делать!"
      end
    rescue ArgumentError
      "Нет задач"
    end
  end

  def status
    case @@list.length
      when (1..max_tasks)
        "работаю"
      when 0
        "свободен"
      else
        "занят"
    end
  end

  def can_add_task?
    @@list.length.between?(0, max_tasks-1)
  end

  def can_work?
    !@@list.length.zero?
  end
end

class JuniorDeveloper < Developer
  MAX_TASKS = 5

  def add_task(task)
    begin
      raise ArgumentError, "Слишком сложно!" if task.size > 20
    rescue ArgumentError
      "Задача слишком сложная"
    else
      super
    end
  end

  def work!
    puts "#{@developer}: пытаюсь делать задачу #{@@list.shift}. Осталось задач: #{@@list.length}" if @@list.length > 0
  end
end

class SeniorDeveloper < Developer
  MAX_TASKS = 15

  def work!
    ["work", "relax"].sample == "work" ? (2.times { puts "#{@developer}: выполнена задача #{@@list.shift}. Осталось задач: #{@@list.length}" }) : ("Что-то лень")
  end
end

