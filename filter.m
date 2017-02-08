%%------------配合fdatool使用------------
b = Num;            %（分子项，输入数据影响因子）FIR只有这个
a = [1];            %（分母项，IIR需要用到这个）
x = input_data;     %输入的数字信号
%%-------------------------------------
t = 1:length(x);
y = filter(b,a,x);
plot(t,x)
hold on
plot(t,y)
legend('Input Data','Filtered Data')
grid on


%%---------filter设计代码------------------
% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 54;  % Sampling Frequency

N     = 6;  % Order
Fpass = 5;   % Passband Frequency
Fstop = 6;   % Stopband Frequency
Wpass = 1;   % Passband Weight
Wstop = 20;  % Stopband Weight
dens  = 20;  % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fpass Fstop Fs/2]/(Fs/2), [1 1 0 0], [Wpass Wstop], ...
           {dens});
Hd = dfilt.dffir(b);

Hd.Numerator                    %滤波器的系数