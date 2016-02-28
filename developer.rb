class Developer

  attr_reader :list
  attr_reader :name
  attr_reader :level

  MAX_TASKS = 10
  @level = :developers

  def max_tasks
    self.class::MAX_TASKS
  end

  def initialize(developer)
    @list = []
    @name = developer
    @level = self.class.instance_variable_get :@level
  end

  def add_task(task)
    @list << task
    if @list.length <= max_tasks
      puts "#{@name}: добавлена задача #{task}. Всего в списке задач: #{@list.length}"
    else
      puts "Слишком много работы!"
    end
  end

  def tasks
    @list.each_with_index.each { |key, value| return "#{value+1}. #{key}" }
  end

  def work!
    begin
      if @list.length > 0
        puts "#{@name}: выполнена задача #{@list.shift}. Осталось задач: #{@list.length}"
      else
        raise ArgumentError, "Нечего делать!"
      end
    rescue ArgumentError
      "Нет задач"
    end
  end

  def status
    case @list.length
      when (1..max_tasks)
        "работаю"
      when 0
        "свободен"
      else
        "занят"
    end
  end

  def can_add_task?
    @list.length < max_tasks
  end

  def can_work?
    !@list.length.zero?
  end

end