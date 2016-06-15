% generate the series after samplied
% clc;close all;
% toff:�����Ъ��
% tc: һ����Ԫ�ĳ���ʱ��
% fs:������
% 
function [output ] = Sampling_GolayCode(A,B,toff,tc,fs)
nc = tc*fs;% һ����Ԫ������ĵ���������
N_off = toff*fs;% ��Ъ�ڶ�Ӧ�Ĳ�����
As = reshape(repmat(A,nc,1),1,[]);% ��������A���Ӧ������
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
legend('A��','B��','A+B');
title('�������GolayCode����ؼ��������֮��');
xlabel('Time/s');
ylabel('����');
end