%% 根据GolayCode的构造方法，构造k阶的A码和B码
% N：要产生的互补码的阶数（位数）
% k：拼接次数
% ii：第ii次拼接
function [An,Bn ]  = Golay_Norder(A0,B0,N)
N0 = length(A0);% 基本码的长度
k = nextpow2(N/N0);% 拼接的次数
if k == 0
    An = A0;
    Bn = B0;
else
[At,Bt] = Golay_Norder(A0,B0,N/2);
An = [At,Bt];
Bn = [At,-Bt];
end
end