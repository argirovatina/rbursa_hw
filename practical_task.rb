require 'pry'

x, y = ARGV
x = x.to_i
y = y.to_i

case
when (-100..100).include?(x) && (-100..100).include?(y)
	puts "Центр!"
when ((-200..200).include?(x)) && ((-200..200).include?(y))
	puts "Близко!"
when ((-300..300).include?(x)) && ((-300..300).include?(y))
	puts "Далеко!"
else
	puts "Мимо!"
end