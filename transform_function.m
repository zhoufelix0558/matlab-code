% % Solve the equation  $3x^2-2x-4=0$.
% % Create a vector to represent the polynomial, then find the roots.
% % 求解2*x^4 + 8*x^3 + x^2 + 5*x + 2 = 0 的根
p = [2 8 1 5 2];
r = roots(p)            



%%----------线性系统的传递函数-----------------
num = [3 2 8];                  %分子项
den = [1 3 8 4 2];              %分母项
G1 = tf(num,den);               %没有采样时间t，则显示为传递函数，自变量为s
 
%             3 s^2 + 2 s + 8
% G =   -----------------------------
%       s^4 + 3 s^3 + 8 s^2 + 4 s + 2
% Continuous-time transfer function.

G11 = zpk(G1);                    %转化为零极点增益形式
z  = G11.z;                      %将G1零点存入z
p  = G11.p;                      %将G1极点存入p
k  = G11.k;                      %将G1增益存入k
%[z,p,k] = tf2zp(num,den)       %替代语句
 pzmap(G11);                      %绘制零极点图
 grid on

%%-----------------离散系统的传递函数------------
t = 0.2;
G2 = tf(num,den,t);              %有采样时间t，则显示为脉冲传递函数，自变量z
% %             3 z^2 + 2 z + 8
% % G2 =  -----------------------------
% %        z^4 + 3 z^3 + 8 z^2 + 4 z + 2
% % Sample time: 0.2 seconds
% % Discrete-time transfer function.
G22 = zpk(G2);                  %求离散系统G2零极点

[num1,den1] = zp2tf(z,p,k);     %转化零极点增益形式为传递函数。

%%%%-------系统的串、并联的传递函数---------
num1 = [2 6 5];
den1 = [1 4 5 2];
G1 = tf(num1,den1);

num2 = [1 7 12];
den2 = [1 3 2];
G2 = tf(num2,den2);

Gs = series(G1,G2);          %或者G = G1*G2;传递函数的串联
Gp = parallel(G1,G2)         %Gp = G1+G2;传递函数的并联


%%代码参考http://wenku.baidu.com/link?url=3K55ezvNFBlgLGFAX_4lAmUYcEOUXNqdkweC2KviJnxGNMp8YcrnKufr2_3XJ64NnB1crBz1fF1RYBK4XTAcq_f7sWxLMVnX0x2Wx1ZcLh7
%%用MATLAB画零极点图.ppt


