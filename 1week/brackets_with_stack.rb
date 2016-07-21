require 'pry'
def matching_brackets(str)
	brackets =  {'[' => ']', '{' => '}', '(' => ')'}
	lefts = brackets.keys
	rights = brackets.values
	stack = []
	str.each_char.with_index do |c, i|
		if lefts.include? c
			
		 	stack.push c

		elsif rights.include? c

			return (i + 1) if stack.empty?

			if !brackets[stack.pop].eql? c
				return (i + 1)
			end
		end
	end
	if stack.empty? 
		return 'Success'
	elsif stack.length == 1
		return 1
	end
end

p matching_brackets gets.chomp