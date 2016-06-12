%% test Golay Code
% clc;close all;clear all;
%% parameters
fs = 1e5;
dt = 1/fs;
A0 = [1,1];
B0 = [1,-1];
N = 256;
%%
[An,Bn ]  = Golay_Norder(A0,B0,N);
Golay_2A = An;
Golay_2B = Bn;
L1 = length(Golay_2B);
G = [Golay_2A,zeros(1,L1),Golay_2B,zeros(1,L1)];
L2 = length(G);
R =xcorr(G,G);
R1 = xcorr(Golay_2A);
R2 = xcorr(Golay_2B);
R3 = R1+R2;
%% display
figure;
plot((1:2*L1-1).*dt,R1,'r','linewidth',2);
hold on;
plot((1:2*L1-1).*dt,R2,'b','linewidth',2);
hold on;
plot((1:2*L1).*dt,R(3*L1+1:L2+L1),'k','linewidth',2);
hold on;
legend('A码','B码','A+B');
title([num2str(N) '阶GolayCode自相关及其自相关之和']);
xlabel('Time/s');
ylabel('幅度');