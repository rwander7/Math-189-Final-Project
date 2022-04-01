function [] = plotSBM(SBM, n, clusters, numClusters)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
XYCoords = zeros(n,2);
x = 1;
y = 1;
numClusters = numClusters;
currentCluster = 1;
currentCluster;
currentClusterLength = clusters(1);
for i = 1:n
    XYCoords(i,1) = x;
    XYCoords(i,2) = y;
    if y <= currentClusterLength 
        x
        y
        y = y + 1;
    else
        x = x+1;
        y = 1;
        currentCluster = currentCluster+1;
        currentCluster;
        currentClusterLength = clusters(currentCluster);
    end
end
%[x,y] = gplot(SBM, XYCoords);
%figure
XYCoords
size(SBM)
size(XCoords)
gplot(SBM, XYCoords);
%Title("SBM Test");
%plot(x,y)
end

