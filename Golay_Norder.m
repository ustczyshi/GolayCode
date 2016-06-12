%% ����GolayCode�Ĺ��췽��������k�׵�A���B��
% N��Ҫ�����Ļ�����Ľ�����λ����
% k��ƴ�Ӵ���
% ii����ii��ƴ��
function [An,Bn ]  = Golay_Norder(A0,B0,N)
N0 = length(A0);% ������ĳ���
k = nextpow2(N/N0);% ƴ�ӵĴ���
if k == 0
    An = A0;
    Bn = B0;
else
[At,Bt] = Golay_Norder(A0,B0,N/2);
An = [At,Bt];
Bn = [At,-Bt];
end
end