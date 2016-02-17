require 'pry'

@@list = []

class Developer
	MAX_TASKS = 10

	def initialize(developer)
		@developer = developer
	end

	def add_task(task)
		@@list << task
		begin
			if @@list.length <= MAX_TASKS
				puts "Вася: добавлена задача #{task}. Всего в списке задач: #{@@list.length}"
			else
				puts "Слишком много работы!"
			end
		rescue

		end
	end

	def tasks
		@@list.each_with_index.each{|key, value| puts "#{value+1}. #{key}"}
	end

	def work!
		begin
			if @@list.length > 0
				puts "Вася: выполнена задача #{@@list.shift}. Осталось задач: #{@@list.length}"
			else
				raise "Нечего делать!"
			end
		rescue

		end
    end
		def status
			case @@list.length
				when (1..MAX_TASKS)
					puts "работаю"
				when 0
					puts "свободен"
				else
					puts "занят"
			end
		end

		def can_add_task?
			@@list.length.between?(0,MAX_TASKS-1)
		end

		def can_work?
			@@list.length.zero?
		end
	end

	class JuniorDeveloper < Developer
		MAX_TASKS = 5

		def work!
		  begin
		    @@list.each{ |task| raise "Слишком сложно!" if @@list.chars.delete_if{|char| char == ' '}.length > 20 }
		    binding.pry
		  rescue
		  	puts "Слишком сложно!"
		  end

		  puts "Вася: пытаюсь делать задачу #{@@list.shift}. Осталось задач: #{@@list.length}" if @@list.length > 0
	    end
end
	class SeniorDeveloper < Developer
		MAX_TASKS = 15

		def work!
			if @@list.length > 0
				puts "Вася: пытаюсь делать задачу #{@@list.shift}. Осталось задач: #{@@list.length}"
			else
				puts "Что-то лень"
			end
		end
	end


	dev = JuniorDeveloper.new('Вася')
 	p dev.add_task('Giese Flo ooioioouioouuou ioiouoiuoiuououoiu oiuououo')

	p dev.add_task('HGHoooioppoippopoipoipopopoipipoipipipipi')
	p dev.add_task('HGH1')
p dev.add_task('Giese Flo')

	p dev.add_task('HGH')
	p dev.add_task('HGH1')
p dev.add_task('Giese Flo')

	p dev.add_task('HGH')
	p dev.add_task('HGH1')
 p dev.add_task('Giese Flo')

# 	p dev.add_task('HGH')
# 	p dev.add_task('HGH1')



	#p dev.tasks
	p dev.work!

#p dev.status
 #p dev.can_add_task?
#p dev.can_work?

