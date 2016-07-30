def treeHeight n, nodes
	nodes = nodes.map.with_index.to_a.sort
	# constructs an array [[-1, 1], [1, 3], [1, 4], [4, 0], [4, 2]]
	treeHeight = 0
	previousNode = 0
	nodes.each_with_index do |node, i|
		if node[0] == -1 and treeHeight == 0
			treeHeight += 1
		elsif treeHeight > 0 and node[0] != nodes[i - 1][0]
			treeHeight += 1
			previousNode = node[0]
		end
	end
	treeHeight
end

n = gets.chomp.to_i
nodes = gets.chomp.split(' ').map{|i| i.to_i}
p treeHeight n, nodes