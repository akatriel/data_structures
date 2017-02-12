RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

# class Stack
#   def initialize(size)
#     @size = size
#     @store = Array.new(@size)
#     @top = -1
#   end
  
#   def pop
#     if empty?
#       nil
#     else
#       popped = @store[@top]
#       @store[@top] = nil
#       @top = @top.pred
#       popped
#     end
#   end
  
#   def push(element)
#     if full? or element.nil?
#       nil
#     else
#       @top = @top.succ
#       @store[@top] = element
#       self
#     end
#   end
  
#   def size
#     @size
#   end
  
#   def look
#     @store[@top]
#   end
  
#   private
  
#   def full?
#     @top == (@size - 1)
#   end
  
#   def empty?
#     @top == -1
#   end
# end

class TreeNode
	attr_accessor :children, :value

	def initialize(v)
		@value = v
		@children = []
	end

	def add_child child
		@children << child
	end
end

class Tree
	attr_accessor :tree_nodes, :height, :root_node

	def initialize nodes
		@tree_nodes = []
		@root_node = nil
		build_tree nodes
		@height = get_height @root_node
	end

	def get_height root
		return 0 if root.nil? 
		h = 0
		# root.children.each do |child|
		# 	h = [get_height(@tree_nodes[child]), h].max
		# end

		root.children.each{|child| h = [get_height(@tree_nodes[child]), h].max }
		return h + 1
	end


	# def get_height root
	# 	stack = [root]
	# 	while !stack.empty?
	# 	  current_params = stack.delete_at(0)
	# 	  unless(current_params.nil?)
	# 	    stack << update_params(current_params)
	# 	  end
	# 	end
	# end

	def build_tree nodes
		nodes.each_with_index do |parent, i| 
			@tree_nodes[i] = TreeNode.new i
			if parent == -1
				@root_node = @tree_nodes[i]
			end
		end
		nodes.each_with_index do |parent_node, tree_node_index|
			if @tree_nodes[tree_node_index] == root_node
				next
			else
				@tree_nodes[parent_node].add_child tree_node_index
			end
		end
	end
end




# class Tre
# 	attr_accessor :a, :b
# 	def initialize nodes
# 		@a = nodes
# 		@b = []
# 		0...a.size.times{|i| @b[i] = -1}
# 	end

# 	def get_height
# 		i = -1
# 		j = -1
# 		0...@a.size.times do |i|
# 			level i
# 		end

# 		0...@a.size.times do |i|
# 			j = [@b[i], j].max
# 		end
# 		j + 1
# 	end

# 	def level i
# 		if @a[i] == -1
# 			@b[i] = 0 
# 		elsif(@b[@a[i]] != -1)
# 			@b[i]= @b[@a[i]] + 1
# 		else
# 			level(@a[i])
# 			@b[i] = @b[@a[i]] + 1
# 		end
# 	end
# end



input = []
ARGF.each_line do |line|
	break if line.chomp == ''
	input << line.split(' ').map{ |i| i.to_i }
end

n = input[0]
nodes = input[1]
tree = Tree.new nodes
# p tree.height
p tree.get_height nodes




