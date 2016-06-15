% generate the series after samplied
% clc;close all;
% toff:发射间歇期
% tc: 一个码元的持续时间
% fs:采样率
% 
function [output ] = Sampling_GolayCode(A,B,toff,tc,fs)
nc = tc*fs;% 一个码元采样后的点数，整数
N_off = toff*fs;% 间歇期对应的采样点
As = reshape(repmat(A,nc,1),1,[]);% 构建采样A码对应的序列
Bs = reshape(repmat(B,nc,1),1,[]);
C_off = zeros(1,N_off);
output = [As,C_off,Bs,C_off];
R1 = xcorr(As)./length(A);
R2 = xcorr(Bs)./length(B);
R3 = (R1+R2)./2;
% display
figure;
plot((1:length(R1))./fs,R1,'r','Linewidth',1);
hold on;
plot((1:length(R2))./fs,R2,'b','Linewidth',1);
hold on;
plot((1:length(R3))./fs,R3,'k','Linewidth',1);
legend('A码','B码','A+B');
title('采样后的GolayCode自相关及其自相关之和');
xlabel('Time/s');
ylabel('幅度');
end