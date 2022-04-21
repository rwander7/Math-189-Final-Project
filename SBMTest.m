alpha = 1;
M = 10000;
kfinal = 10;
Hs = zeros(kfinal);
%errs = zeros(kfinal);
%ks = zeros(kfinal);
for i = 2:kfinal
    i
    clusters1 = [1,2,4,8];
    for j = 1:4
        clusters1(j) = i*clusters1(j);
    end
    k = 2;
    n = 15*i;
    SBM1 = makeSBM(n, 0.8, 0.2, clusters1, 4, false);
    SBM1;
    SBM1 = zeros(n,n);
    for m = 1:6
        temp = makeSBM(n, 0.8, 0.2, clusters1, 4, false);
        SBM1 = SBM1 + temp;
    end
    SBM1;
    [H1, err] = multUp_SymNMF(SBM1, k, alpha, M);
    H1;
    %Hs(i-1) = H1;
    errs(i-1) = err(end);
    ks(i-1) = i;
    clusterList = printClusters(H1);
end

ks
errs
%%figure(1);
%semilogy(2:10,errs(:,1),'LineWidth',3)                      %plot the error
%set(gca,'Fontsize',14)
%xlabel("Iteration $k$",'FontSize',18,'Interpreter','latex')
%ylabel("model error, $\|A - HH^\top\|_F^2$",'FontSize',18,'Interpreter','latex')


for k = 1:10
    clusters = [4,8,16,32];
    n = 60;
    SBM2 = makeSBM(n, 0.8, 0.2, clusters, 4, false);
    SBM1;
    SBM2 = zeros(n,n);
    for m = 1:6
        temp = makeSBM(n, 0.8, 0.2, clusters, 4, false);
        SBM2 = SBM2 + temp;
    end
    SBM1;
    [H1, err] = multUp_SymNMF(SBM1, k, alpha, M);
    H1;
   
    clusterList = printClusters(H1);
end
             %train the model



%figure(1)
%plot(SBM1);
%hold off;
%plotSBM(SBM1, 12, clusters1, 4);
clusters2 = [3,3,3,3];
SBM2 = makeSBM(12, 0.8, 0.2, clusters2, 4, false);
for i = 1:100
    temp = makeSBM(12, 0.8, 0.2, clusters2, 4, false);
    SBM2 = SBM2+temp;
end
SBM2;
