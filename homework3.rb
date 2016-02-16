require 'pry'

@@list = []
MAX_TASKS = 10

class Developer
	def initialize(developer)
		@developer = developer
	end

	def add_task(task)
		@@list << task
		if @@list.length <= MAX_TASKS
			puts "Вася: добавлена задача #{task}. Всего в списке задач: #{@@list.length}"
		else
			puts "Слишком много работы!"
		end
	end

	def tasks
		tasks_number = (1..@@list.length)
		h = Hash[tasks_number.zip @@list]
		h.each  {|key, value| puts "#{key}." "#{value}"}
	end

	def work!
		first_task = @@list.shift
		
		if @@list.length > 0
			puts "Вася: выполнена задача #{first_task}. Осталось задач: #{@@list.length}"
		else
			puts "Нечего делать!"
		end
	end

	def status
		if @@list.length.between?(1,MAX_TASKS) 
			puts "работаю"
		elsif @@list.length == 0
			puts "свободен"
		else
			puts "занят"
		end
	end

	def can_add_task?
		if @@list.length.between?(0,MAX_TASKS) 
			true
		else
			false
		end
	end

	def can_work?
		if @@list.length > 0
			true
		else
			false
		end
	end
end

class JuniorDeveloper < Developer
	MAX_TASKS = 5

	def work!
		first_task = @@list.shift
		puts "Слишком сложно!" if first_task.length > 20
		
		if @@list.length > 0
			puts "Вася: пытаюсь делать задачу #{first_task}. Осталось задач: #{@@list.length}"
		else
			puts "Нечего делать!"
		end
	end
end

class SeniorDeveloper < Developer
	MAX_TASKS = 15

	def work!
		first_task = @@list.shift
		
		if @@list.length > 0
			
			puts "Вася: пытаюсь делать задачу #{first_task}. Осталось задач: #{@@list.length}"
		else
			puts "Что-то лень"
		end
	end
end


dev = Developer.new('Вася')
# p dev.add_task('Giese Flo')

# p dev.add_task('HGH')
# p dev.add_task('HGH1')



# p dev.tasks
# p dev.work!
p dev.status
p dev.can_add_task?
p dev.can_work?

