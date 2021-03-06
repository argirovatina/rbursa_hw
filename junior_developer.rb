require_relative 'developer'

class JuniorDeveloper < Developer
  MAX_TASKS = 5
  @level = :juniors

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
    puts "#{@name}: пытаюсь делать задачу #{@list.shift}. Осталось задач: #{@list.length}" if @list.length > 0
  end
end