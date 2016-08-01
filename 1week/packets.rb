input = []
ARGF.each_line do |line|
	break if line.chomp == ''
	input << line.split(' ').map{ |i| i.to_i }
end

line1 = input[0].split(' ')
input[0].shift
s = line1[0]
n = line1[1]

