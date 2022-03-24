function [SBM] = makeSBM(n,prob1, prob2, clusters)
%Creates nxn Stochastic Block Matrix representing the adhacency matrix of
%an unweighted graph
%   n - the dimension of the Block Matrix
%   prob1 - the probability of there being an edge between two nodes in a
%   cluster
%   prob2 - the probability of there being an edge between two nodes not in
%   a cluster
%   clusters - array representing the size of each cluster
SBM = zeros(n,n);
for i = 1:n
    for j = 1:n
       if i ~= j
           r = randi(1);
           if r < prob2
              SBM(i,j) = 1;
           end
       end
    end
end
start_index = 1;
for k = 1:size(clusters)
    end_index = start + clusters[i]; 
    for i = start_index:end_index
        for j = start_index:end_index
            if i ~= j
                r = randi(1);
                if r < prob1
                    SBM(i,j) = 1;
                else 
                    SBM(i,j) = 0;
                end
            end
        end
    end
    start_index = end_index;
end
end

