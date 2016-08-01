def matching_brackets(str)
	brackets = {'[' => ']', '{' => '}', '(' => ')'}
	lefts = brackets.keys
	rights = brackets.values
	stack = []
	j = []
	str.each_char.with_index do |c, i|
		if lefts.include? c

		 	stack.push c
		 	j[i] = c
		elsif rights.include? c

			if !brackets[stack.pop].eql? c
				return (i + 1)
			end
			if brackets[j.last] == c
				j.pop 
			end
		end
		# p 'J:' + j.to_s
		# p 'Stack: ' + stack.to_s
	end
	if stack.empty? 
		return "Success"
	else
		( j.rindex stack.last ) + 1
	end
end
puts matching_brackets gets.chomp
