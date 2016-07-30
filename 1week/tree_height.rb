def treeHeight n, nodes
	root = nodes.find_index -1
	# construct tree then find depth
	#tree[0] = root, [children]
	nodes = nodes.map.with_index.to_a
	# constructs an array [[4, 0], [-1, 1], [4, 2], [1, 3], [1, 4]]

	tree = [[]] #initialize tree

	tree[0].push root #move root to treeHeighte and remove from nodes?
	nodes[root] = nil


	nodes
end

n = gets.chomp.to_i
nodes = gets.chomp.split(' ').map{|i| i.to_i}
p treeHeight n, nodes