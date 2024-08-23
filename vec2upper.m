function [A] = vec2upper(v)
% input v
% output A n_nodes x n_nodes
n = round((sqrt(8 * numel(v) + 1) - 1) / 2)+1;
A = zeros(n, n);
a = 1;
for k = 1:n-1
  b         = a + k - 1;
  A(1:k, k+1) = v(a:b);
  a         = b + 1;
end

% A = triu(A)+triu(A,1)';
A = triu(A);