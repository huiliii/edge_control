function edge_adj = inc2edgeadj(inc)
% for each individual brain network
% input: incidence matirx (num_node x num_edge)
% output: edge-level adjacency matirx (num_edge x num_edge)

[num_node, num_edge] = size(inc);

edge_adj = zeros(num_edge,num_edge);

for a = 1:num_edge
    for b = 1:num_edge
        if a~=b
            edge_adj(a,b) = sum(inc(:,a).*inc(:,b));
        else
            edge_adj(a,b) = 0;
        end
    end
end


