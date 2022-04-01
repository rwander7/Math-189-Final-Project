clusters1 = [2,2];
SBM1 = makeSBM(4, 1, 0, clusters1, 2, false);
SBM1
figure(1)
plot(SBM1);
hold off;
%plotSBM(SBM1, 12, clusters1, 4);
SBM2 = makeSBM(4, 1, 0, clusters1, 2, true);
SBM2
