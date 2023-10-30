function inc = adj2inc(adj)
% for each individual brain network
% input:  node-level adjacency matrix (num_node x num_node)
% output: incidence matrix (num_node x num_edge)

num_node = size(adj,1);
num_edge = 0.5*(num_node-1)*num_node;

edge_node_map = vec2upper(1:num_edge);
inc = zeros(num_node, num_edge);

for i = 1:num_node
    for j = i+1:num_node
        edge_idx = edge_node_map(i,j);
        inc(i,edge_idx) = sqrt(adj(i,j));
        inc(j,edge_idx) = sqrt(adj(i,j));
    end
end
        
        

