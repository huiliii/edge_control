% addpath
addpath './utils'
addpath './controllability_code'% download from https://complexsystemsupenn.com/s/controllability_code-smb8.zip
addpath './control_energy_code' % download from https://github.com/ursbraun/network_control_and_dopamine

% load node-level structural connectome (sc) adjacency matrix
SC = readmatrix(sc_sub.txt);
B = adj2inc(SC); 
Edge_SC = inc2edgeadj(B);
% save edge-centric matrix as .txt
writematrix('./edge_sc_sub.txt')

% calculate average controllability, model controllability 
eac = ave_control(Edge_SC);
emc = modal_control(Edge_SC);

% simulation of brain network activation 


% normalized 
ESC_test = Edge_SC./(eigs(Edge_SC,1)+1)-eye(size(Edge_SC,1));

% network initiation
base_state = zeros(size_edge,1);
target_state = FPN; % define your target brain network 

[~, U_opt, ~] = optim_fun(A_test, 1, base_state, target_state, 1);
CE_opt = trapz(U_opt.^2)';

