%%   函数实现求单阶跃响应
% 输入参数：
%       1.阶跃函数输入时刻tstart;
%       2.从阶跃输入开始的观测时间长度t ,为向量形式，包括了步长
%       3.测点位置坐标x
%       4.收-发极距r
%       5.电阻率为rou
%       6.磁导率u0
%       7.电力矩m
function [E] = step_response(t,x,r,rou,u0,m)
% t = t+tstart;
tao = 2*pi*(2*t*rou/u0).^0.5;
u = 2^0.5*pi*r./tao;
A = rou/(2*pi*r^3);
B = exp(-u.^2);
C = 1-3*(x/r)^2;
E = -m*A*(erf(u)-2.*u.*B./(pi)^0.5+C);
end