% ���Բ������Golaycode������غ���
clc;close all;clear all;
%% parameters
fs = 1e5;
fc = 1e4;
tc = 1/fc;
dt = 1/fs;
A0 = [1,1];
B0 = [1,-1];
N = 64;
%% generate the A code and B code
[An,Bn ]  = Golay_Norder(A0,B0,N);
%%------------------------------------------------------
%    ����ǰԴ�������
%%-------------------------------------------------------
Golay_2A = An;
Golay_2B = Bn;
L1 = length(Golay_2B);
G = [Golay_2A,zeros(1,L1),Golay_2B,zeros(1,L1)];
L2 = length(G);
%%
figure;
stairs((1:L1).*tc,An,'r','linewidth',2);
hold on;
stairs((1:L1).*tc,Bn,'b:','linewidth',2);
hold on;
legend('A��','B��');
title([num2str(N) '��GolayCode������']);
axis([0 (N+1)*tc -2 2]);
grid on;
xlabel('Time/s');
ylabel('����');
%%
figure;
stairs((1:L2).*tc,G,'r','linewidth',2);
hold on;
% stairs((1:L1).*tc,Bn,'b:','linewidth',2);
% hold on;
% legend('A��','B��');
title([num2str(N) '��GolayCode������']);
axis([0 4*N*tc -2 2]);
grid on;
xlabel('Time/s');
ylabel('����');
%%
R =xcorr(G,G)./2./L1;
R1 = xcorr(Golay_2A)./L1;
R2 = xcorr(Golay_2B)./L1;
R3 = R1+R2;
% display
figure;
plot((1:2*L1-1).*dt,R1,'r','linewidth',2);
hold on;
plot((1:2*L1-1).*dt,R2,'b','linewidth',2);
hold on;
plot((1:2*L1).*dt,R(3*L1+1:L2+L1),'k','linewidth',2);
hold on;
legend('A��','B��','A+B');
title([num2str(N) '��GolayCode����ؼ��������֮��']);
xlabel('Time/s');
ylabel('����');
%% -------------------------------------------------------
% �����������
%% -------------------------------------------------------
toff = L1*tc;
[golay_samplied ] = Sampling_GolayCode(An,Bn,toff,tc,fs);
L3 = length(golay_samplied);
Rs =xcorr(golay_samplied)./L1./2;
L4 = N*2*tc*fs;
% display
figure;
plot((1:L4)./fs,Rs(L4+1:2*L4),'r','Linewidth',1);
hold on;
title('�������GolayCode�����');
xlabel('Time/s');
ylabel('����');



