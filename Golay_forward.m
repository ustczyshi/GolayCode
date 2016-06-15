%% Golay forward
clc;close all;clear all;
%
%% 1.set the Golay code parameters
fc = 1e4;  %M序列的码元频率为1K ,fc > 100*rou/(u0*r^2)
fs = 1e5;
tc = 1/fc;  %M序列的码元间隔 为 0.25ms < tpeak 满足要求  取dt = tpeak/10
dt = 1/fs;
%{
 N 可以取1024、2048、4096、8192;
设得到的脉冲响应的持续时间为T
N*tc=N/fc=T;
Golay互补码自相关之和最大值为
fs/fc*(2*N*a^2)=2*T*fs*a^2;
%}
T = 0.5;% 取时间为0.2s
N = 2048;
toff = N*tc;
%% 2.generate the Golay code
A0 = [1,1];
B0 = [1,-1];
[An,Bn ]  = Golay_Norder(A0,B0,N);%产生长度为n的互补码的A码和B码
%% 3.smpling the golay code
 [Itx ] = Sampling_GolayCode(An,Bn,toff,tc,fs);
%% 4.di
dI = diff([0,Itx]);
%{
r = 1000;    %收-发极距
u0 = 4*pi*1e-7; %磁导率
rou = 50;    %电阻率
Ncyc = 3;   %M序列周期数
% 发射电流信息
I = 1;    % 取I = 1A；
dxs = 1; % 取发射电极距和接收电极距均为1m
dxr = 1; % 接收电极距
m = I*dxs;
%    设定PRBS的阶数
n = 8;     %M序列的阶次
Np = 2^n-1;
%    设定观测时间
% T = 0.1;% 观测时间为50ms
tpeak = u0*r^2/(10*rou); %  约为 2.51ms
TLIST = 10*10*dt;% tpeak = 10*dt  
T = Ncyc*Np*dt + TLIST;
%}
%% 6. forward <- conv(di,step_response);