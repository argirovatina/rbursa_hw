require 'pry'

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
				puts "Вася: добавлена задача #{task}. Всего в списке задач: #{@@list.length}"
			else
				puts "Слишком много работы!"
			end
	end

	def tasks
		@@list.each_with_index.each{|key, value| return "#{value+1}. #{key}"}
	end

	def work!
		begin
			if @@list.length > 0
				puts "Вася: выполнена задача #{@@list.shift}. Осталось задач: #{@@list.length}"
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
		@@list.length.between?(0,max_tasks-1)
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
      puts "Вася: пытаюсь делать задачу #{@@list.shift}. Осталось задач: #{@@list.length}" if @@list.length > 0
    end
end

class SeniorDeveloper < Developer
	MAX_TASKS = 15

	def work!
	  ([] << (2.times{super}) << ("Что-то лень")).sample
	end
end


	dev = SeniorDeveloper.new('Вася')
 #p dev.add_task('Giese Flo ooioioouioouuou ioiouoiuoiuououoiu oiuououo')

# 	p dev.add_task('HGHoooioppoippopoipoipopopoipipoipipipipi')
# 	p dev.add_task('HGH1')
# p dev.add_task('Giese Flo')

# 	p dev.add_task('HGH')
# 	p dev.add_task('HGH1')
# p dev.add_task('Giese Flo')

# 	p dev.add_task('HGH')
# 	p dev.add_task('HGH1')
#  p dev.add_task('Giese Flo')
#   p dev.add_task('Giese Flo')
    p dev.add_task('Giese Flo')
     p dev.add_task('Giese Flo')

 	p dev.add_task('HGH')
 	p dev.add_task('HGH1')



	#p dev.tasks
 	p dev.work!

# p dev.status
  p dev.can_add_task?
 p dev.can_work?

