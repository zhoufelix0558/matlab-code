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