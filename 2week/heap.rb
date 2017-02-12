class Heap
	attr_accessor :heap_size, :array_rep

	def initialize n, arr
		@heap_size = n
		@array_rep = arr
		@operations = []
	end

	def left_child i 
		(2 * i) + 1
	end
	def right_child i
		(2 * i) + 2
	end 
	def parent i
		((i - 1) / 2)
	end

	def left_child_key(i)
		@array_rep[left_child(i)]
	end

	def right_child_key(i)
		@array_rep[right_child(i)]
	end
	
	def max_satisfied?(i)
		@array_rep[i] >= left_child_key(i) and @array_rep[i] >= right_child_key(i)
	end

	def min_satisfied?(i)
		@array_rep[i] <= left_child_key(i) and @array_rep[i] <= right_child_key(i)
	end

	def leaf_node?(i)
		i >= @heap_size / 2
	end

	def fix_to_max(i)
		return if leaf_node?(i) || max_satisfied?(i)

		left_child_key = @array_rep[left_child(i)]
		right_child_key = @array_rep[right_child(i)]

		#set larger child
		larger_child = if left_child_key > right_child_key then left_child(i) else right_child(i) end
		
		@operations << larger_child.to_s + ' ' + i.to_s

		#swap larger of the two
		@array_rep[i], @array_rep[larger_child] = @array_rep[larger_child], @array_rep[i]

		fix_to_max(larger_child)
	end

	def fix_to_min(i)
		return if leaf_node?(i) || min_satisfied?(i)

		left_child_key = @array_rep[left_child(i)]
		right_child_key = @array_rep[right_child(i)]

		#set smaller child
		smaller_child = if left_child_key < right_child_key then left_child(i) else right_child(i) end
		
		@operations << i.to_s + ' ' + smaller_child.to_s

		#swap smaller of the two
		@array_rep[i], @array_rep[smaller_child] = @array_rep[smaller_child], @array_rep[i]

		fix_to_min(smaller_child)
	end

	def create_max_heap
		(0..(@heap_size / 2 - 1)).to_a.reverse.each do |i|  
			fix_to_max(i)
		end
		p @operations.length
		@operations.each{|s| puts s}
	end

	def create_min_heap
		(0..(@heap_size / 2 - 1)).to_a.reverse.each do |i|  
			fix_to_min(i)
		end
		p @operations.length
		@operations.each{|s| puts s}
	end

	def get_root
		array_rep[0]
	end
end

input = []
ARGF.each_line do |line|
	break if line.chomp == ''
	input << line
end

n = input[0].to_i
arr = input[1].split(' ').map{|i| i.to_i}

heap = Heap.new n, arr

p heap.create_min_heap