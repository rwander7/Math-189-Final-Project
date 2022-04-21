function [clusters] = printClusters(H)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[data, nClusters] = size(H);
%clusters = zeros(nClusters, data);
clusters = zeros(nClusters, 10);
firstOpenSpot = ones(nClusters);
%for i = 1:nClusters
%    clusters(i) = [];
%end
for i = 1:data
    maxVal = H(i,1);
    maxCluster = 1;
    for j = 2:nClusters
        if H(i,j) > maxVal
            maxVal = H(i,j);
            maxCluster = j;
        end
    end
    clusters(maxCluster, firstOpenSpot(maxCluster)) = i;
    firstOpenSpot(maxCluster) = firstOpenSpot(maxCluster)+1;
end

