%% Golay forward
clc;close all;clear all;
%
%% 1.set the Golay code parameters
fc = 1e4;  %M���е���ԪƵ��Ϊ1K ,fc > 100*rou/(u0*r^2)
fs = 1e5;
tc = 1/fc;  %M���е���Ԫ��� Ϊ 0.25ms < tpeak ����Ҫ��  ȡdt = tpeak/10
dt = 1/fs;
%{
 N ����ȡ1024��2048��4096��8192;
��õ���������Ӧ�ĳ���ʱ��ΪT
N*tc=N/fc=T;
Golay�����������֮�����ֵΪ
fs/fc*(2*N*a^2)=2*T*fs*a^2;
%}
T = 0.5;% ȡʱ��Ϊ0.2s
N = 2048;
toff = N*tc;
%% 2.generate the Golay code
A0 = [1,1];
B0 = [1,-1];
[An,Bn ]  = Golay_Norder(A0,B0,N);%��������Ϊn�Ļ������A���B��
%% 3.smpling the golay code
 [Itx ] = Sampling_GolayCode(An,Bn,toff,tc,fs);
%% 4.di
dI = diff([0,Itx]);
%{
r = 1000;    %��-������
u0 = 4*pi*1e-7; %�ŵ���
rou = 50;    %������
Ncyc = 3;   %M����������
% ���������Ϣ
I = 1;    % ȡI = 1A��
dxs = 1; % ȡ����缫��ͽ��յ缫���Ϊ1m
dxr = 1; % ���յ缫��
m = I*dxs;
%    �趨PRBS�Ľ���
n = 8;     %M���еĽ״�
Np = 2^n-1;
%    �趨�۲�ʱ��
% T = 0.1;% �۲�ʱ��Ϊ50ms
tpeak = u0*r^2/(10*rou); %  ԼΪ 2.51ms
TLIST = 10*10*dt;% tpeak = 10*dt  
T = Ncyc*Np*dt + TLIST;
%}
%% 6. forward <- conv(di,step_response);